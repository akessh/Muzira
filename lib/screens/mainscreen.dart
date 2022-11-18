import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/screens/favoarites_screen.dart';
import 'package:music_app_main/screens/home.dart';
import 'package:music_app_main/screens/mostplay.dart';
import 'package:music_app_main/screens/playlist_screen.dart';
import 'package:music_app_main/screens/recentscreen.dart';


class screenmain extends StatefulWidget {
  const screenmain({super.key});

  @override
  State<screenmain> createState() => _screenmainState();
}

class _screenmainState extends State<screenmain> {
  final navigationkey=GlobalKey<CurvedNavigationBarState>();
  int  index=1;


  
  final _pages=[
   
   const ScreenFavorites(),
    ScreenHome(audiosongs: audiosongs),
   const ScreenPlayList(),
   
   
  ];
  
  @override
  Widget build(BuildContext context) {
    final items=<Widget>[
      
      const Icon(Icons.favorite),
      const Icon(Icons.home),
      const Icon(Icons.playlist_add),
      
    ];

    return Scaffold(
      backgroundColor: const  Color.fromARGB(255, 85, 85, 85) ,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white)
        ),
        child: CurvedNavigationBar(
          
          color: const   Color.fromARGB(255, 144, 144, 144) ,
          key: navigationkey,
          items:items ,
          index: index,
          onTap: (index) =>setState(()=>this.index=index),
          
          backgroundColor: Colors.transparent,
          height: 55,
          animationCurve: Curves.easeInOut,
          animationDuration:const Duration(milliseconds: 300),
        ),
      ) ,
      body:_pages[index], 
       
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Color.fromARGB(255, 124, 1, 126),
      //   backgroundColor: Color.fromARGB(255, 120, 120, 120),
      //   unselectedItemColor: Colors.white,
      //   currentIndex: _currentselectedindex,
      //   onTap: (newindex){
      //     setState(() {
      //       _currentselectedindex=newindex;
      //     });
          
      //   },
      //   items:[
      //     BottomNavigationBarItem(icon:Icon(Icons.favorite),label:'favorites',),
      //     BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home' ),
      //     BottomNavigationBarItem(icon:Icon(Icons.playlist_add) ,label: 'Playlist')
      //   ]
      //   ),
      //   body: _pages[_currentselectedindex],

      
     extendBody: true,
    );
  }
}