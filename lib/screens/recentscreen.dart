
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/models/boxmodel.dart';
import 'package:music_app_main/open%20audio/openaudio.dart';
import 'package:music_app_main/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';



class ScreenRecent extends StatefulWidget {
  const ScreenRecent({super.key});

  @override
  State<ScreenRecent> createState() => _ScreenRecentState();
}

class _ScreenRecentState extends State<ScreenRecent> {
  List<Audio>recentmusiclist=[];
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
          title: Text('Recently Played',style: GoogleFonts.alef(color:Colors.white,letterSpacing: 1,fontSize: 25),),
        ),
        
        body: ValueListenableBuilder(
          valueListenable: box.listenable(), 
          builder: (context, Boxes,_) {
            final recentsongs=box.get("recent");
            if(recentsongs==null||recentsongs.isEmpty){
              return const Center(
                child: Text('Oops...! \n No Recents',
                style:TextStyle(
                  fontFamily: "poppinz",
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                ),
              );
            }else{
              return ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    for (var element in recentsongs){
                      recentmusiclist.add(
                        Audio.file(
                          element.uri!,
                          
                          metas: Metas(
                            title: element.title,
                            id: element.id.toString(),
                            artist: element.artist,
                          )
                        )
                      );

                    }
                    PlayMyAudio(allSongs: recentmusiclist, index: index).
                    openAsset(index: index,audios: recentmusiclist);
                    //addmostplayed(index: index);

                    showBottomSheet(
                      
                       shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        
                        backgroundColor:Colors.transparent,
                      context: context, 
                      builder:(context) => MiniPlayer(
                        index: index, audiosongs: audiosongs),);
                  },
                  child: ListTile(
                    leading: QueryArtworkWidget(id: recentsongs[index].id,
                     type: ArtworkType.AUDIO,
                     nullArtworkWidget: ClipOval(
                      child:Image.asset(
                  'assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight,
                ),  
                     ),
                     ),
                     title: Text(recentsongs[index].title,
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                     style: const TextStyle(
                      color: Colors.white
                     ),
                     ),
                     subtitle: Text(
                      recentsongs[index].artist=='<unknown>'?
                      'Unknown Artist':recentsongs[index].artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        color: Colors.white
                      ),
                     ),
                     
                  ),
                ),
                itemCount: recentsongs.length,
                );
            }
            
          },),
         
      ),
    );
  }
}



// 