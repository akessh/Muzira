import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenPlaylistSong extends StatefulWidget {
  const ScreenPlaylistSong({super.key});

  @override
  State<ScreenPlaylistSong> createState() => _ScreenPlaylistSongState();
}

class _ScreenPlaylistSongState extends State<ScreenPlaylistSong> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor:const Color.fromARGB(255, 11, 1, 17) ,
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 11, 1, 17) ,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:const Icon(Icons.keyboard_double_arrow_left,size: 35,)),
        centerTitle: true,
        title: Text('List name',style: GoogleFonts.alef(color:Colors.white,letterSpacing: 1,fontSize: 25),),
      ),
      
      body:
       ListView.builder(
         shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {

        return   ListTile(
          
          leading: Container(
            margin: EdgeInsets.only(left: 10, right: 10,top:size.height*0.01),
            width: 50,
            height: size.height*0.07,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child:Image.asset(
                'assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.bottomRight,
              ), 

            ),

          ),
         
          
            title:const Text(
              'GANNAM STYLE',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            subtitle:const Text('Author Name',style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255)),),
                    trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.delete,color: Colors.white,)),

            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const PlayerMain()));
            },
            
         
          

        );
        
      }),
    );
  }
}