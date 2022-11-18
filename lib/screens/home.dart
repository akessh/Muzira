

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/functions/mostplayfunction.dart';
import 'package:music_app_main/functions/recentfunction.dart';
import 'package:music_app_main/models/songModel.dart';
import 'package:music_app_main/open%20audio/openaudio.dart';
// import 'package:music_app_main/screens/demo.dart';
// import 'package:music_app_main/screens/mainplayer.dart';
import 'package:music_app_main/screens/mostplay.dart';
// import 'package:music_app/screens/favoraites_screen.dart';
// import 'package:music_app/screens/playlist_screen.dart';
// import 'package:music_app/screens/settings.dart';
// import 'package:music_app/widgets/hometile_widget.dart';
//import 'package:music_app_main/screens/playlist_screen.dart';
import 'package:music_app_main/screens/recentscreen.dart';
import 'package:music_app_main/screens/settings.dart';
import 'package:music_app_main/screens/srearchscreen.dart';
//import 'package:music_app_main/widgets/bottombar_widget.dart';
import 'package:music_app_main/widgets/miniplayer.dart';
import 'package:music_app_main/widgets/playlistfromHome.dart';
import 'package:on_audio_query/on_audio_query.dart';
//import 'favoarites_screen.dart';


class ScreenHome extends StatefulWidget {

  int count=0;

   List<Audio> audiosongs=[];
   ScreenHome({super.key,
   required this.audiosongs,
   });
 

   

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
 // int _currenselectedindex=1;

  List<dynamic>? likedsongs=[];

  Future refresh() async{
    setState(() {
    });
    fectchingSongs();
    await Future.delayed(const Duration(seconds: 2));
  }
  
 
@override
   void initState(){
    super.initState();

    databasesongs=box.get('musics');
    likedsongs = box.get("favorites");
   }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Color.fromARGB(255, 124, 1, 126),
      //   backgroundColor: Color.fromARGB(255, 120, 120, 120),
      //   unselectedItemColor: Colors.white,
      //   currentIndex: _currenselectedindex,
      //   onTap: (newindex){
      //     setState(() {
      //       _currenselectedindex=newindex;
      //     });
          
      //   },
      //   items:[
      //     BottomNavigationBarItem(icon:Icon(Icons.favorite),label:'favorites',),
      //     BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home' ),
      //     BottomNavigationBarItem(icon:Icon(Icons.playlist_add) ,label: 'Playlist')
      //   ]
      //   ),
      
      // backgroundColor:const Color.fromARGB(255, 11, 1, 17) ,/s
      backgroundColor:const Color.fromARGB(255, 85, 85, 85) ,
      appBar: AppBar(
       
        centerTitle: true,

        title:Text('M U Z I R A',style: GoogleFonts.alef(color:Colors.white,letterSpacing:3,fontSize: 20,),),

        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ScreenSearch() ,));


          }, icon:const Icon(Icons.search_sharp))
        ],

        toolbarHeight:size.height*0.07 ,
        backgroundColor:Colors.transparent,
      ),
      body:ListView(

       

        children: [
       
          Stack(
            children: [
      //         Container(
      //           width: double.infinity,
      //           height: size.height*0.25,
      //           decoration: const BoxDecoration(
      //              gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [
      //     Color.fromARGB(255, 65, 63, 63),
      //     Color.fromARGB(255, 15, 5, 17)
      //   ]),
      //    borderRadius: BorderRadius.all(
      //     Radius.circular(30)
          
      // ),
      //             ),
                       
      //               child: ListView(
      //                 scrollDirection: Axis.horizontal,
      //                 children:[ Row(
      //                   children: [
      //                     GestureDetector(
      //                       onTap: () {
      //                         Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ScreenFavorites(),));
      //                       },
      //                       child: Card(
      //                          color:const  Color.fromARGB(100, 22, 44, 33),
      //                                  shape: RoundedRectangleBorder(
      //                       borderRadius:BorderRadius.circular(20),
      //                                           ),
      //                         child: Column(
                                      
      //                             children: [
      //                               ClipRRect(
                                      
      //                                  borderRadius: BorderRadius.circular(20),
      //                                 child: Image.asset('assets/images/home/006c54bd634be01c3ad8b8d3676bcb03.jpg',  
      //                                 height: size.height*0.19,
      //                                 width: size.width*0.4,
      //                                 fit: BoxFit.cover,
                                      
      //                                   ),
                                        
                                        
      //                               ),
      //                               SizedBox(height: size.height*0.01,),
                                    
      //                        const   Text('Favoraties',style: TextStyle(fontSize: 18,color: Colors.white),)
                                    
                                  
                                  
      //                             ],
      //                         ),
                            
      //                       ),
      //                     ),
                    
      //                     GestureDetector(
      //                       onTap: () {
      //                         Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  ScreenPlayList(),));
      //                       },
      //                       child: Card(
      //                          color:const  Color.fromARGB(100, 22, 44, 33),
      //                                  shape: RoundedRectangleBorder(
      //                       borderRadius:BorderRadius.circular(20),
      //                                           ),
      //                         child: Column(
                                      
      //                             children: [
      //                               ClipRRect(
      //                                  borderRadius: BorderRadius.circular(20),
      //                                 child: Image.asset('assets/images/home/006c54bd634be01c3ad8b8d3676bcb03.jpg',  
      //                                 height: size.height*0.19,
      //                                 width: size.width*0.4,
      //                                 fit: BoxFit.cover,
      //                                   ),
      //                               ),
      //                               SizedBox(height: size.height*0.01,),
      //                           const   Text('Play List',style: TextStyle(fontSize: 18,color: Colors.white),),
                                  
      //                             ],
      //                         ),
      //                       ),
      //                     ),
      //                     GestureDetector(
      //                       onTap: () {
      //                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScreenRecent()));
      //                       },
      //                       child: Card(
      //                          color:const  Color.fromARGB(100, 22, 44, 33),
      //                                  shape: RoundedRectangleBorder(
      //                       borderRadius:BorderRadius.circular(20),
      //                 ),
      //                         child: Column(
                                      
      //                             children: [
      //                               ClipRRect(
      //                                  borderRadius: BorderRadius.circular(20),
      //                                 child: Image.asset('assets/images/home/006c54bd634be01c3ad8b8d3676bcb03.jpg',  
      //                                 height: size.height*0.19,
      //                                 width: size.width*0.4,
      //                                 fit: BoxFit.cover,
      //                                   ),
      //                               ),
      //                               SizedBox(height: size.height*0.01,),
      //                           const   Text('Recently Play',style: TextStyle(fontSize: 18,color: Colors.white),),
                                  
      //                             ],
      //                         ),
      //                       ),
      //                     ),

      //                        GestureDetector(
      //                       onTap: () {
      //                         Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ScreenMostPlay(),));
      //                       },
      //                       child: Card(
      //                          color:const  Color.fromARGB(100, 22, 44, 33),
      //                                  shape: RoundedRectangleBorder(
      //                       borderRadius:BorderRadius.circular(20),
      //                                           ),
      //                         child: Column(
                                      
      //                             children: [
      //                               ClipRRect(
                                      
      //                                  borderRadius: BorderRadius.circular(20),
      //                                 child: Image.asset('assets/images/home/006c54bd634be01c3ad8b8d3676bcb03.jpg',  
      //                                 height: size.height*0.19,
      //                                 width: size.width*0.4,
      //                                 fit: BoxFit.cover,
                                      
      //                                   ),
                                        
                                        
      //                               ),
      //                               SizedBox(height: size.height*0.01,),
                                    
      //                        const   Text('Mostly Played',style: TextStyle(fontSize: 18,color: Colors.white),)
                                    
                                  
                                  
      //                             ],
      //                         ),
                            
      //                       ),
      //                     ),
                    
      //                   ],
      //                 ),
      //                 ]
  
      //               ),
                
      //          ),
      //          SizedBox(height: size.height*0.9,),
                     
           
              Container(
                width: double.infinity,
                //color: Colors.deepPurple,
                height: size.height*0.817,
                decoration:  const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [
                    //   Color.fromARGB(255, 21, 3, 32),
                    // Color.fromARGB(255, 11, 1, 17)
                     Color.fromARGB(255, 85, 84, 85) ,
                    Color.fromARGB(255, 130, 130, 130),
                    Color.fromARGB(255, 85, 85, 85) ,
                   ]),
                  // color: Colors.blue,
                     borderRadius: BorderRadius.only(
                      topRight :Radius.circular(30),
                       topLeft :Radius.circular(30),
                    
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 // scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height:size.height*0.01,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Text('All Songs',style: GoogleFonts.alef(color:Colors.white,letterSpacing: 1,fontSize: 23),),
                    ),
                    Expanded(
                      child:audiosongs.isEmpty? Center(child: Column(
                        children: [
                         const Text('No Songs',style: TextStyle(color: Colors.white),),
                          ElevatedButton(onPressed: (){
                            refresh();
                            
                          }, child:const Text('Try To Refresh',style: TextStyle(color: Colors.white),))
                        ],
                      ),)
                      
                      : ListView.builder(
            shrinkWrap: true,
               //songlist.length,
               itemCount:widget. audiosongs.length,
              itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(  
                  
                 // leading: Image.asset('assets/images/most.jpg'),
                 leading: QueryArtworkWidget(
                  id: int.parse(widget.audiosongs[index].metas.id.toString()),
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget:Container(
                  //  margin:const EdgeInsets.only(left: 1, right: 10,),
                   width: size.width*0.15,
                   height:size.height*0.09 ,
                   //color: Colors.amber,
                   //color: Colors.amber,
                   child: ClipRRect(
                     borderRadius: const BorderRadius.all(
                       Radius.circular(30),
                     ),
                     child: Image.asset(
                       'assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg',
                       fit: BoxFit.cover,
                       alignment: Alignment.bottomRight,
                     ),
                   ),
                                ),
                 ) ,
                  title: Text(
                    // songlist[index].metas.title.toString(),
                    widget.audiosongs[index].metas.title.toString(),
                    maxLines: 1,
                    style:const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  subtitle: Text(
                    // songlist[index].metas.artist.toString(),
                  widget.audiosongs[index].metas.artist.toString()==
                  '<unknown>'?'unknown':widget.audiosongs[index].metas.artist.toString(),
                  maxLines: 1,
                    style:const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),),
        
                  trailing:IconButton(onPressed: (){
                   showDialog(context: context,
                    builder: (context){
                      return Dialog(

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                          ),
                          child: Padding(padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              // liked songs

                              likedsongs!.where((element) =>
                               element.id.toString()==databasesongs![index].
                               id.toString()).isEmpty?
                               ListTile(
                                title: const Text('Add To Favorites',
                                textAlign: TextAlign.center,
                                style:TextStyle(
                                  fontFamily: "poppinz",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                  
                                ),
                                ),
                                onTap: () async{
                                  final songs=box.get("musics") as 
                                  List<LocalSongs>;
                                  final temp=songs.firstWhere((element) => 
                                  element.id.toString()==widget.audiosongs[index].metas.id.toString()
                                  );
                                  favorites=likedsongs!;
                                  favorites.add(temp);
                                  box.put("favorites", favorites);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Added To Favorites",
                                    style:TextStyle(
                                      fontFamily: "poppinz",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    backgroundColor: Color.fromARGB(255, 104, 102, 102),
                                    behavior:SnackBarBehavior.floating, 
                                    
                                    ),
                                   
                                  );
                                  Navigator.of(context).pop();
                                  
                                  
                                },
                               ):
                               ListTile(

                                leading: const Text(
                                  'Remove From Favorites',
                                  textAlign: TextAlign.center,
                                  style:TextStyle(
                                    fontFamily: "poppinz",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold

                                  ),
                                ),
                                onTap: () async {
                                  likedsongs?.removeWhere((element) => 
                                  element.id.toString()==databasesongs![index].id.toString());
                                await box.put("favorites", likedsongs!);
                                setState(() {
                                  
                                });
                                Navigator.of(context).pop();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('removed From Favorites',
                                  style:TextStyle(
                                    fontFamily: "poppinz",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  backgroundColor: Color.fromARGB(255, 104, 102, 102),
                                  behavior: SnackBarBehavior.floating,

                                  )
                                  
                                                              
                                );
                                },

                               ),

                               // add playlist------->

                                ListTile(
                                title:const Text('Add To Playlist',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "poppinz",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  

                                ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                     builder: (context) => HomePlaylistAdd(song:widget.audiosongs[index]),);
                                     
                                  
                                },
                               )
                            
                                         
                            ],
                            
                          ),
                          ),
                        ),
                      );
                    }
                    );
                  }, 
                  icon:const Icon(
                    Icons.more_vert,
                    color: Colors.white,)),
        
                  onTap: () async{

                      PlayMyAudio(
                        allSongs: audiosongs, 
                        index: index,)
                        .openAsset(index: index,
                        audios: audiosongs);
                        addrecent(index: index);
                        addmostplayed(index: index);

                       
                          
                        

                        
                  showBottomSheet(
                    
                    backgroundColor:Colors.transparent,
                    
                    
                     shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(35),),
     
                 
                  
                    context: context, 
                    builder: (ctx) => 
                    
                    // MiniPlayer(
                    //   index: index,
                    //    audiosongs: audiosongs),
                    
                       MiniPlayer(index: index,
                        audiosongs: audiosongs,
                        
                        ),
                    
                       );




                     
                        
                  },
                  
                ),
              );
              }) )
                    
                  
                    
                  ],
                 ),
              
              
              )
            ],
          ),
          
        ],
      ),
      drawer: Drawer( 
        
        backgroundColor: const Color.fromARGB(136, 111, 108, 108),
        
        
        // ignore: sort_child_properties_last
        child: ListView(
          
          children: [
            DrawerHeader(
              child: Padding(
                padding:const  EdgeInsets.only(left: 90,right:90 ),
                child: Text('Muzira',style: GoogleFonts.alef(color:Colors.white,letterSpacing: 1,fontSize: 23)),
              )),
            ListTile(
              title:const  Text('Home',style: TextStyle(color: Colors.white),),
              leading: IconButton(onPressed: (){}, icon:const Icon(Icons.home,color: Colors.white,)),
              onTap:() {
                Navigator.of(context).pop();
              }, 
            ),
        const  Padding(
            padding:  EdgeInsets.only(left: 15,right: 15),
            child:   Divider(thickness: 1,color: Colors.black,),
          ),
             ListTile(
              title:const Text('Recents',style: TextStyle(color: Colors.white,),),
              leading: IconButton(onPressed: (){
              }, icon:const Icon(Icons.recent_actors_sharp,color: Colors.white,)),
              onTap:() {
                 Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ScreenRecent(),));
              },
            ),
            const  Padding(
            padding:  EdgeInsets.only(left: 15,right: 15),
            child:   Divider(thickness: 1,color: Colors.black,),
          ),
             ListTile(
              title:const Text('Most Played',style: TextStyle(color: Colors.white,),),
              leading: IconButton(onPressed: (){
              }, icon:const Icon(Icons.music_video,color: Colors.white,)),
              onTap:() {
                 Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ScreenMostPlay(),));
              },
            ),
            const  Padding(
            padding:  EdgeInsets.only(left: 15,right: 15),
            child:   Divider(thickness: 1,color: Colors.black,),
          ),
             ListTile(
              title:const Text('Settings',style: TextStyle(color: Colors.white,),),
              leading: IconButton(onPressed: (){
              }, icon:const Icon(Icons.settings,color: Colors.white,)),
              onTap:() {
                 Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const ScreenSettings(),));
              },
            )
          ],
        ),
         shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   onTap: (newindex){

      //   },
      //   items:[
      //     BottomNavigationBarItem(icon:Icon(Icons.favorite),label:'favorites' ),
      //     BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home' ),
      //     BottomNavigationBarItem(icon:Icon(Icons.playlist_add) ,label: 'Playlist')
      //   ]
      //   )
      
 
    );
  }
}