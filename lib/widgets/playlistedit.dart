

import 'package:flutter/material.dart';
import 'package:music_app_main/functions/functions.dart';

class playlistedit extends StatefulWidget {
   playlistedit({super.key,required this.playlistnameforedit});
  final String playlistnameforedit;

  @override
  State<playlistedit> createState() => _playlisteditState();
}

class _playlisteditState extends State<playlistedit> {
  late TextEditingController namecontroller;
  String playlistnewname='';

  @override
  void initState() {
    // TODO: implement initState
    namecontroller=TextEditingController(text: widget.playlistnameforedit.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade400,
      
      content: TextField(
        cursorColor: Colors.white,
        controller: namecontroller,
        decoration: const InputDecoration(
        
          // border:OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30), 
          // ),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.white)
          // ),
          hintStyle: TextStyle(
            color: Colors.white
          ),
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Color(0xff2b2b29),
          //     width: 2.0,
          //   )
          // )
        ),
        onChanged: (value) {
          playlistnewname=value;
        },
      ),
      actions: [
        TextButton(
          onPressed: (){
          List playlistnames=box.keys.toList();
          if(!playlistnames.contains(playlistnewname)){
            List <dynamic> playlistsongs=box.get(widget.playlistnameforedit)!;
            box.delete(widget.playlistnameforedit);
            box.put(playlistnewname, playlistsongs);
          }else{
            ScaffoldMessenger(
              child: SnackBar
              (content:Text('$playlistnewname already exist in playlist',style:const TextStyle(color: Colors.white),)),
              
            );
            ScaffoldMessenger.of(context).
            showSnackBar(SnackBar(
              content: Text('$playlistnewname already exist in playlist',
              style:const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              ))
              );
          }
          Navigator.of(context).pop();
        }, child: const Text(
          "Edit",
          style: TextStyle(
            fontFamily: "poppinz",
           color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold

          ),
        ))
      ],
      
    );
  }
}