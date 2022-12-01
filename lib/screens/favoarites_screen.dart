import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app_main/functions/recentfunction.dart';
import 'package:music_app_main/open%20audio/openaudio.dart';
import 'package:music_app_main/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';


class ScreenFavorites extends StatefulWidget {
  const ScreenFavorites({super.key});

  @override
  State<ScreenFavorites> createState() => _ScreenFavoritesState();
}

class _ScreenFavoritesState extends State<ScreenFavorites> {
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
          
          centerTitle: true,
          title: Text('Favorites',style: GoogleFonts.alef(color:Colors.white,letterSpacing: 1,fontSize: 25),),
        ),
        
        body:ValueListenableBuilder(
          valueListenable:box.listenable(),
           builder:(context, Boxes, _) {
            final likedsongs =box.get("favorites");
            if (likedsongs==null || likedsongs.isEmpty){
              return const Center(
                child: Text('No Favorites',style: TextStyle(color: Colors.white),),
              );
            }else{
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      for(var element in likedsongs){
                        PlayLikedSong.add(
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
                      PlayMyAudio(allSongs: PlayLikedSong, index: index).
                      openAsset(index: index,audios:audiosongs);
                      addrecent(index: index);

                      showBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        backgroundColor:const Color.fromARGB(255, 104, 102, 102),
                        context: context,
                         builder:(ctx) =>MiniPlayer(
                          index: index, 
                          audiosongs: PlayLikedSong) ,);
                    },
                    child: ListTile(
                      leading: QueryArtworkWidget(
                        id: likedsongs[index].id, 
                        type:ArtworkType.AUDIO,
                        nullArtworkWidget: ClipOval(
                          child: Image.asset('assets/images/home/HD-wallpaper-listen-to-the-music-girl-music-black-and-white-headphones-woman.jpg',
                           width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                          ),
                        ),
                        ),
                        trailing: IconButton(onPressed:() {
                          setState(() {
                            likedsongs.removeAt(index);
                            box.put("favorites",likedsongs);
                            
                          });
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                              'Removed From Favorites',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Color.fromARGB(255, 104, 102, 102),
                            behavior: SnackBarBehavior.floating,
                            
                            )
                            );
                          
                        }, icon:const Icon(Icons.favorite,color: Colors.white,)),
                        title: Text(
                          likedsongs[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "poppinz",
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        subtitle: Text(
                          likedsongs[index].artist=='<unknown>'?'unknown':likedsongs[index].artist,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "poppinz",
                            fontWeight: FontWeight.w300) ,
                        ),
                    ),
                  );
                
                
              },
              itemCount: likedsongs.length,
              );

            }
             
           },)

        
      ),
    );
  }
}