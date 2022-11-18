// import 'package:flutter/material.dart';
// import 'package:music_app_main/functions/functions.dart';
// import 'package:music_app_main/screens/favoarites_screen.dart';
// import 'package:music_app_main/screens/home.dart';
// import 'package:music_app_main/screens/playlist_screen.dart';


// class WidgetBottomBar extends StatefulWidget {
//   const WidgetBottomBar({super.key});

//   @override
//   State<WidgetBottomBar> createState() => _WidgetBottomBarState();
// }

// class _WidgetBottomBarState extends State<WidgetBottomBar> {
//   int _currenselectedindex =0;

//   final screens =[
//     ScreenFavorites(),
//     ScreenHome(audiosongs: audiosongs),
//     ScreenPlayList()
//   ];
  
  
//   @override
//   Widget build(BuildContext context) {  
//     return Scaffold(
//       body:screens[_currenselectedindex] ,
//         bottomNavigationBar: BottomNavigationBar(
//         currentIndex:_currenselectedindex ,
//         onTap:(newindex){
//           setState(() {
//             _currenselectedindex=newindex;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon:IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),label: 'Favorites'),
//           BottomNavigationBarItem(icon:IconButton(onPressed: (){}, icon: Icon(Icons.home)),label: 'Home'),
//           BottomNavigationBarItem(icon:IconButton(onPressed: (){}, icon: Icon(Icons.playlist_add)),label: 'Playlist'),
          
          
    
//         ]
//         ),
//     );
//   }
// }