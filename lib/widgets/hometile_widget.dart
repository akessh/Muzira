
// //import 'package:assets_audio_player/assets_audio_player.dart';


// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:music_app_main/functions/functions.dart';



// import '../functions/functions.dart';
// import '../screens/mainplayer.dart';
// //import '../songlist/assetsong_list.dart';
// import 'package:on_audio_query/on_audio_query.dart';


// class TileList extends StatefulWidget {
//    TileList({super.key,required this.audiosongs});

//    List<Audio> audiosongs=[];



//   @override
//   State<TileList> createState() => _TileListState();
// }

// class _TileListState extends State<TileList> {
//   @override

// final _audioQuery= OnAudioQuery();

//   @override
//   Widget build(BuildContext context) {
//     Size size =MediaQuery.of(context).size;
//     return ListView.builder(
//             shrinkWrap: true,
//                //songlist.length,
//                itemCount: audiosongs.length,
//               itemBuilder: (context, index) {
//                 return  ListTile(
//                  // leading: Image.asset('assets/images/most.jpg'),
//                  leading: Container(
//                   margin:const EdgeInsets.only(left: 10, right: 10,),
//                   width: size.width*0.12,
//                   height:size.height*0.07 ,
//                   //color: Colors.amber,
//                   //color: Colors.amber,
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                     child: Image.asset(
//                       'assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg',
//                       fit: BoxFit.cover,
//                       alignment: Alignment.bottomRight,
//                     ),
//                   ),
//                 ) ,
//                   title: Text(
//                     // songlist[index].metas.title.toString(),
//                     'Song name',
//                     style:const TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                   ),
//                   subtitle: Text(
//                     // songlist[index].metas.artist.toString(),
//                   'Artist Name',
//                     style:const TextStyle(
//                           color: Color.fromARGB(255, 255, 255, 255)),),
        
//                   trailing:IconButton(onPressed: (){}, icon:const Icon(Icons.more_vert,color: Colors.white,)),
        
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> PlayerMain(
                     
//                       // index: index,
//                       // song: songlist[index],
//                       // assetaudioplayer: audioPlayer,
//                     )
//                     )
//                     );
//                   },
                  
//                 );
//               });  
    

//   }
// }