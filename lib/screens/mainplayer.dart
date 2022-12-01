

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/widgets/playlistfromHome.dart';
import 'package:on_audio_query/on_audio_query.dart';



// import 'package:music_app/songlist/asetsong_list.dart';
 //import 'package:music_app/widgets/mainplayer_widget.dart';


class PlayerMain extends StatefulWidget {
  Audio? Song;
  List<Audio> myaudiosong=[];
  int index;

   PlayerMain({super.key,
   song,
   required this.myaudiosong,
   required this.index
 
   });



  @override
  State<PlayerMain> createState() => _PlayerMainState();
}



class _PlayerMainState extends State<PlayerMain> {
  bool nextdone=true;
  bool predone=true;
  int repeat=0;

  bool previsible=true;
  bool nextvisible=true;


  List<dynamic>likedSongS=[];

  buttondisable(){
    if(widget.index==0){
      previsible=false;
    }else{
      previsible=true;
    }
    if(widget.index==audiosongs.length -1){
      nextvisible=false;
    }else{
      nextvisible=true;
    }
  }
  
   @override
   void initState() {
    buttondisable();
  
    super.initState();
    assetsAudioPlayer.play();

  }


  @override
  Widget build(BuildContext context) {
    var  globalmyAudio;
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
          title: Text('Now Playing',style: GoogleFonts.alef(color:Colors.white,letterSpacing: 1,fontSize: 25),),
          actions: [
            IconButton(onPressed: (){
              // Navigator.of(context).pop();
              showModalBottomSheet(
                context: context, 
                builder:(context) => HomePlaylistAdd(song:globalmyAudio),);
            }, icon:const Icon(Icons.playlist_add))
          ],
        ),
        body:
        assetsAudioPlayer.builderCurrent(
          builder: (context,Playing? playing) {
            final myAudio=find
            (widget.myaudiosong,playing!.audio.assetAudioPath);
            final currentSong=databaseSongs.firstWhere(
              (element) => element.id.toString()==myAudio.metas.id.toString());
              globalmyAudio=myAudio;

               likedSongS=box.get("favorites")!;
              if(playing.audio.assetAudioPath.isEmpty){
                return const Center(
                  child: Text('Loading...'),
                );
              }else{
                return ListView(
            children: [
               Container(
           margin: EdgeInsets.only(left: 30,right: 30,top:size.height*0.04),
                width: 130,
                height: size.height*0.43,
                //color: Colors.amber,
                child: QueryArtworkWidget(
                  id: int.parse(myAudio.metas.id!),
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: 
                   ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    child: Image.asset(
                      'assets/images/home/360_F_60169635_VkAGhjGaizCR9h9XzJGEmbcCH14BuuyG.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
        
            ),
        
              ListTile(
               
                title: Padding(
                  padding:const EdgeInsets.only(left: 20,right: 20),
                  child: //Text(widget.song!.metas.title.toString(),
                           
                            Text(myAudio.metas.title.toString(),
                             style: const TextStyle(
                        fontFamily: "poppinz",
                        color: Colors.white,),)

                           
                ),
                subtitle: Padding(
                  padding:const EdgeInsets.only(left: 20,right: 20),
                  child: Text(myAudio.metas.artist.toString()=='unknown'?'unknown artist'
                  :myAudio.metas.artist.toString(),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                   // widget.song!.metas.artist.toString(),
                   style:const TextStyle(color: Colors.white),),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 7,left: 7),
                  child:likedSongS.where((element) => element.id.toString()==
                  currentSong.id.toString()).isEmpty?
                  IconButton(
                    onPressed: ()async{
                       likedSongS.add(currentSong);
                       ScaffoldMessenger.of(context)
                       .showSnackBar(const SnackBar(
                        content: Text('Added To Favorites ',
                        style: TextStyle(
                          fontFamily: "poppinz",
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        backgroundColor: Color.fromARGB(255, 104, 102, 102),
                        behavior: SnackBarBehavior.floating,
                        ));
                        setState(() {
                          
                        });
                    }, 
                    icon:const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,)
                      ) :IconButton(onPressed: (){
                        setState(() {
                          likedSongS.removeWhere((element) =>element.id.toString()==
                          currentSong.id.toString());
                          box.put("favorites", likedSongS);
                        });
                        ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                          content: Text('Romoved From Favorites',
                          style: TextStyle(
                            fontFamily: "poppinz",
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          backgroundColor: Color.fromARGB(255, 104, 102, 102),
                          behavior: SnackBarBehavior.floating,
                          ));
                      },
                       icon:const Icon(Icons.favorite,color: Colors.white,))
                )
              ),
        
             Padding(
               padding:  EdgeInsets.only(left: 40,right: 40,top:size.height*0.05),
               child: assetsAudioPlayer.builderRealtimePlayingInfos(
                builder: (context, realtimePlayingInfos) {
                Duration currentposition = realtimePlayingInfos.currentPosition;
                Duration totalduration = realtimePlayingInfos.duration;
                return ProgressBar(
                  timeLabelTextStyle: 
                  const TextStyle(color: Colors.white, fontSize: 16),
                  thumbColor: Colors.white,
                  baseBarColor: Colors.grey,
                  progressBarColor:const Color.fromARGB(255, 44, 44, 44),
                  barHeight: 4,

                  
                  progress: currentposition, 
                  total: totalduration,
                  onSeek: (to) {
                    assetsAudioPlayer.seek(to);
                  },
                  );
                 
               },)
             ),
        
             Padding(
               padding:  EdgeInsets.only( top: size.height*0.07,left: 29,right: 29),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                 children: [
                   IconButton(onPressed: (){
                    setState(() {
                      assetsAudioPlayer.toggleShuffle();

                                        });
                
                   }, 
                   icon:assetsAudioPlayer.isShuffling.value?
                   const Icon(Icons.shuffle_on_outlined,color: Colors.white,size: 25,)
                   :const Icon(Icons.shuffle,color: Colors.white,size: 30,)
                   
                   ),
        
                  //  SizedBox(width: size.width*0.05,),
        
                  previsible ?Visibility(
                    visible: previsible,
                    child: IconButton(onPressed: ()async{
                       setState(() {
                                  widget.index = widget.index + 1;
                                  if (widget.index != audiosongs.length - 1) {
                                    nextvisible = true;
                                  }
                                });
                                if(predone){
                                  predone=false;
                                await  assetsAudioPlayer.previous();
                                  predone=true;
                                }
                      
                      
                        
                      
                     }, 
                     icon:const Icon(
                       Icons.skip_previous,color: Colors.white,size: 35,)),
                  ):
                  const  SizedBox(width:50,),
        
                  PlayerBuilder.isPlaying(
                    player:assetsAudioPlayer, 
                    builder:(context, isPlaying) {
                      return GestureDetector(
                        onTap: () async{
                          await assetsAudioPlayer.playOrPause();
                          setState(() {
                            
                          });
        
                          
                        },
                        child: Icon(
                          isPlaying?Icons.pause
                          :Icons.play_arrow,
                          color: Colors.white,
                          size: 35,
                        ),
                      );
                    },
                     ),
                  
                      nextvisible? Visibility(
                        visible: nextvisible,
                        child: IconButton(onPressed: ()async {

                          setState(() {
                            widget.index=widget.index+1;
                            if(widget.index>0){
                              previsible=true;
                            }
                          });
                          if(nextdone){
                              nextdone=false;
                          await assetsAudioPlayer.next();
                            nextdone=true;
                            }
                          
                      
                        },
                        
                                         
                        icon:const Icon(Icons.skip_next,color: Colors.white,size: 35,)),
                      ):
                   
                  const SizedBox(width:50),
                   IconButton(onPressed: (){
                    setState(() {
                      if(repeat%2==0){
                        assetsAudioPlayer.setLoopMode(LoopMode.single);
                        repeat++;
                      }else{
                        assetsAudioPlayer.setLoopMode(LoopMode.none);
                        repeat++;
                      }
                      
                    });
        
                   },
                    icon: repeat%2==0? 
                  const  Icon(Icons.repeat,
                    color: Colors.white,
                    size: 30,):const Icon(
                      Icons.repeat_on_outlined,
                      color: Colors.white,
                      size: 25,
                    )
                    )
                 
                  
                 ],
               ),
             )
        
            
        
        
            ],
          );
              }
          
        },)
        
      ),
    );
  }
}