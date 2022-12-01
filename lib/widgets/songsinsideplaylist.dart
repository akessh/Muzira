

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/functions/playistfunctions.dart';
import 'package:music_app_main/functions/recentfunction.dart';
import 'package:music_app_main/models/boxmodel.dart';
import 'package:music_app_main/open%20audio/openaudio.dart';
import 'package:music_app_main/widgets/addSong.dart';
import 'package:music_app_main/widgets/miniplayer2.dart';
import 'package:on_audio_query/on_audio_query.dart';

class songsinsideplaylist extends StatefulWidget {
   songsinsideplaylist({super.key,required this.playlistname});
  String playlistname;

  @override
  State<songsinsideplaylist> createState() => _songsinsideplaylistState();
}

class _songsinsideplaylistState extends State<songsinsideplaylist> {
  final box= Boxes.getinstence();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
         colors:[
                    Color.fromARGB(255, 85, 84, 85) ,
                    Color.fromARGB(255, 130, 130, 130),
                    Color.fromARGB(255, 85, 85, 85) ,
         ]
        ),
      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        appBar: AppBar(
          leading: IconButton(onPressed:() {
           Navigator.of(context).pop();
          }, 
          icon:const Icon(Icons.arrow_back_ios_new_outlined)),
          actions: [
            IconButton(onPressed: (){
              showModalBottomSheet(
                backgroundColor: Colors.grey,
                context: context, 
              builder:(context) {
                return SongAdd(playlistname:widget. playlistname);
              },);

            }, icon:const Icon(Icons.add))
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding:const EdgeInsets.all(15),
                  child: ValueListenableBuilder(
                    valueListenable: box.listenable(),
                     builder: (context, Boxes,_) {
                      final playlistSongs=box.get(widget.playlistname)!;
                      return playlistSongs.isEmpty?
                    const  SizedBox(
                        child: Center(
                          child: Text('No Songs',
                          style: TextStyle(
                            fontFamily: "poppinz",
                            fontSize: 13,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                          ),
                        ),
                      ):ListView.builder(
                        itemCount: playlistSongs.length,
                        itemBuilder: (context, index) =>
                       GestureDetector(
                        onTap: () {
                          for (var element in playlistSongs){
                            playlistplay.add(Audio.file(element.uri!,
                            metas: Metas(
                              title: element.title,
                              id: element.id.toString(),
                              artist: element.artist,
                            )
                            ));
                          }
                          PlayMyAudio(allSongs: playlistplay, index: index).
                          openAsset(index: index,audios: audiosongs);
                          addrecent(index: index);

                          showBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              
                            ),
                            backgroundColor: Colors.grey,
                            context: context,
                             builder:(context) => SecondMiniPlayer(
                              index: index, audiosongs: playlistplay),);
                        },
                        child: ListTile(
                          leading:SizedBox(
                            height: 50,
                            width: 50,
                            child: QueryArtworkWidget(id: playlistSongs[index].id!, 
                            type:ArtworkType.AUDIO,
                            artworkBorder: BorderRadius.circular(15),
                            artworkFit: BoxFit.cover,
                            nullArtworkWidget: Container(
                              height: 47,
                              width: 47,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15)
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg'),
                                  fit: BoxFit.cover
                                  )
                              ),
                            ),
                            
                            ),
                          ),
                          title: Text(
                            playlistSongs[index].title!.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: "poppinz",
                              color: Colors.white

                            ),
                          ),
                          subtitle: Text(
                            playlistSongs[index].artist!.toString(),
                             maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: "poppinz",
                              color: Colors.white

                            ),
                          ),
                          trailing: IconButton(

                            onPressed: (){
                              setState(() {
                                playlistSongs.removeAt(index)!;
                              });
                              ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                content: Text(
                                  "Removed From Playlist",                     
                            style:  TextStyle(
                              fontFamily: "poppinz",
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white

                            ),
                                ),
                                backgroundColor: Colors.grey,
                                behavior: SnackBarBehavior.floating,
                                
                                ));

                            }, 
                            icon:const Icon(Icons.clear,color: Colors.white,)),
                        ),
                       ),);
                     }),
                  ),
              ))
          ],
        ),

      ),
    );
  }
}