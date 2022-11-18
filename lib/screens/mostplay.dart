
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/functions/mostplayfunction.dart';
import 'package:music_app_main/models/boxmodel.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app_main/open%20audio/openaudio.dart';
import 'package:music_app_main/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ScreenMostPlay extends StatefulWidget {
  const ScreenMostPlay({super.key});

  @override
  State<ScreenMostPlay> createState() => _ScreenMostPlayState();
}

class _ScreenMostPlayState extends State<ScreenMostPlay> {

  List<Audio>mostplayedslist=[];
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
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
          backgroundColor:Colors.transparent,
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon:const Icon(Icons.arrow_back_ios_new_outlined,)),
          centerTitle: true,
          title: Text('Most Played',style: GoogleFonts.alef(color:Colors.white,letterSpacing: 1,fontSize: 25),),
        ),
        
        body: ValueListenableBuilder(
          valueListenable:box.listenable(),
           builder:(context, Boxes,_) {
            final mostplayedsongs=box.get("mostplay");
            if(mostplayedsongs==null||mostplayedsongs.isEmpty){
              return const Center(
                child:Text('Ooops... Not Found',
                // ignore: unnecessary_const
                style:TextStyle(
                  fontFamily: "poppinz",
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                ),
              );
            }
            else{
              return ListView.builder(itemBuilder:(context, index) => GestureDetector(
                onTap:() {
                  for(var element in mostplayedsongs){
                    mostplayedslist.add(Audio.file(
                     element.uri!,
                     metas: Metas(
                      id: element.id.toString(),
                      title: element.title,
                      artist: element.artist,

                     )
                    )
                    );

                  }
                  PlayMyAudio(
                    allSongs: mostplayedslist,
                     index: index,).openAsset(index: index,audios:mostplayedslist);

                     showBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                       builder: (context) => MiniPlayer(
                        index: index, 
                        audiosongs: audiosongs),);
                     
                  
                },
                child: ListTile(
                  leading: QueryArtworkWidget(id:mostplayedsongs[index].id, 
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: ClipOval(
                    child:Image.asset(
                  'assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight,
                ), 
                     ),
                  ),
                  title: Text(
                    mostplayedsongs[index].title,
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                     style: const TextStyle(
                      color: Colors.white,
                  ) 
                ),
                subtitle: Text(mostplayedsongs[index].artist=='<unknown>'?
                      'Unknown Artist':mostplayedsongs[index].artist,
                      maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                     style: const TextStyle(
                      color: Colors.white,
                     ) 
                )
              ),
              ) ,
              itemCount: mostplayedsongs.length,
              
              );

            }

         
           }
        )
        
           ),
    );
       
  }
}

