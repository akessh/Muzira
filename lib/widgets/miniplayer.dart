
import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'package:music_app_main/screens/mainplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../functions/functions.dart';

class MiniPlayer extends StatefulWidget {
  int index;
  List<Audio> audiosongs = [];

  MiniPlayer({Key? key, required this.index, required this.audiosongs})
      : super(key: key);

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  AssetsAudioPlayer assetsaudioplayer = AssetsAudioPlayer.withId('0');
  bool prevvisible = true;
  bool nxtvisible = true;

  buttondesable() {
    if (widget.index == 0) {
      prevvisible = false;
    } else {
      prevvisible = true;
    }

    if (widget.index == audiosongs.length - 1) {
      nxtvisible = false;
    } else {
      nxtvisible = true;
    }
  }

  @override
  void initState() {
    log("message");
    buttondesable();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return assetsaudioplayer.builderCurrent(
        builder: (context, Playing? playing) {
      final myAudio = find(audiosongs, playing!.audio.assetAudioPath);

      return Padding(
        padding: const EdgeInsets.only(bottom: 58),
        child: SizedBox(
            height: size.height * 0.09,
            child: ListTile(
              tileColor:const Color.fromARGB(255, 104, 102, 102),
              contentPadding: const EdgeInsets.only(bottom: 15, left: 5, top: 7),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
                ),
              ),
              leading: QueryArtworkWidget(
                id: int.parse(myAudio.metas.id!),
               // artworkFit: BoxFit.cover,
                artworkBorder: BorderRadius.circular(100),
                type: ArtworkType.AUDIO,
                nullArtworkWidget: ClipOval(

                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg',
                     width: size.width*0.1,
                    // height:size.height*0.,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PlayerMain(index: widget.index, myaudiosong: audiosongs),
                ));
              },
              title: Marquee(
                text: myAudio.metas.title.toString(),
                pauseAfterRound: const Duration(seconds: 3),
                velocity: 30,
                blankSpace: 50,
                style: const TextStyle(
                    fontFamily: "poppinz",
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  prevvisible
                      ? Visibility(
                          visible: prevvisible,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.index = widget.index + 1;
                                  if (widget.index != audiosongs.length - 1) {
                                    nxtvisible = true;
                                  }
                                  assetsAudioPlayer.previous();
                                });
                              },
                              icon: const Icon(
                                Icons.skip_previous_sharp,
                                color: Colors.white,
                                size: 30,
                              )),
                        )
                      : const SizedBox(
                          width: 30,
                        ),
                  PlayerBuilder.isPlaying(
                      player: assetsAudioPlayer,
                      builder: (context, isPlaying) {
                        return GestureDetector(
                          onTap: () async {
                            await assetsAudioPlayer.playOrPause();
                          },
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        );
                      }),
                  nxtvisible
                      ? Visibility(
                          visible: nxtvisible,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.index = widget.index + 1;
                                  if (widget.index > 0) {
                                    prevvisible = true;
                                  }
                                  assetsAudioPlayer.next();
                                });
                              },
                              icon: const Icon(
                                Icons.skip_next_sharp,
                                color: Colors.white,
                                size: 30,
                              )),
                        )
                      : const SizedBox(
                          width: 30,
                        )
                ],
              ),
            )),
      );
    });
  }
}