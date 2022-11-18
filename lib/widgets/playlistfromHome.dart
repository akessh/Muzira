
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/functions/playistfunctions.dart';
import 'package:music_app_main/models/boxmodel.dart';
import 'package:music_app_main/models/songModel.dart';


class HomePlaylistAdd extends StatelessWidget {
 HomePlaylistAdd({super.key,required this.song});
Audio song;

  @override
  Widget build(BuildContext context) {
    final box=Boxes.getinstence();
    playlists=box.keys.toList();
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
      padding:const EdgeInsets.only(top: 20,bottom: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left:5 ,right: 5,bottom: 10),
            child: ListTile(
              onTap: () => showCupertinoDialog(
                context: context, builder:(context) => AlertDialog(
                  backgroundColor:const Color.fromARGB(255,130,130,130),
                  title: const Text("Add New playlist",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "poppinz",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  content: TextField(
                    style: const TextStyle(
                      color:Colors.white, 
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 2)
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Playlist name',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 31, 29, 29),
                          width: 1,
                        )
                      )
                    ),
                    onChanged: (value) {
                      playlistname=value;
                    },
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: TextButton(onPressed: 
                      (){
                        List<LocalSongs>library=[];
                        List?excistingname=[];
                        if(playlists.isNotEmpty){
                          excistingname=playlists.where((element) => element==playlistname).toList();
                        }
                        if(playlistname !=''&&
                        playlistname !='favorites'&&
                        playlistname !='recent'&&
                        playlistname !='mostplay'&&
                        excistingname.isEmpty
                        ){
                          box.put(playlistname, library);
                          Navigator.of(context).pop();
                    
                          playlists=box.keys.toList();
                        }else{
                          Navigator.of(context).pop();
                        }
                        
                      }, child:const Text("Add",
                      style: TextStyle(
                        fontFamily: "poppinz",
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      )),
                    )
                  ],
                ),
                ),
                leading: 
              const Icon(Icons.add,size: 25,color: Colors.white,),
                title:const Text('Creat Playlist',
                style: TextStyle(fontFamily: "poppinz",
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
                ),
                ),
            ),
            ),
            ...playlists.
            map((element) => element !="musics"&& element != "favorites" && element != "recent"&& element !="mostplay"?
               librarylist(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Container(
                  height: 75,
                  width: 95,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 69, 68, 68).withOpacity(0.5),
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0, 0),
                    child: ListTile(
                      onTap: ()async {

                        playlistsongs=box.get(element);
                        List existingSongs=[];
                        existingSongs=playlistsongs!.where((element) =>
                        element.id.toString()==song.metas.id.toString()

                         ).toList();
                         if(existingSongs.isEmpty){
                          final songs=box. get("musics")as List<LocalSongs>;
                          final temp=songs.firstWhere((element) => element.id.toString()==song.metas.id.toString());
                          playlistsongs?.add(temp);

                          await box.put(element,playlistsongs!);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:const Text('Added To Playist',
                              style: TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,

                              ),
                              ),
                              backgroundColor: Color.fromARGB(255, 58, 57, 57),
                              behavior: SnackBarBehavior.floating,
                              
                               )
                          );
                         }else{
                          Navigator.of(context).pop();
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content:Text('Already in Playlist',
                          style: TextStyle(
                            fontFamily: "poppinz",
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          backgroundColor: Color.fromARGB(255, 58, 57, 57),
                          behavior: SnackBarBehavior.floating,
                          )
                         );
                         }
                        
                      },
                      leading: Container(
                        height: 45,
                        width: 45,
                        decoration:const  BoxDecoration(
                          
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child:const  CircleAvatar(
                   radius: 40,
                    
                    backgroundImage: AssetImage(
                       'assets/images/home/MM433_1200x1200.webp', 
                    ),

                ),
                      ),
                      title: Text(
                        element.toString(),
                        style:const TextStyle(
                          fontFamily: "poppinz",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    ),
                ),
                )
              ):Container()
            ).toList()
         
        ],
      ),
    );
  }

  librarylist({required child}){
    return Padding(padding: EdgeInsets.only(left: 5,right: 5,bottom: 10,),
    child: child,
    );
  }
}