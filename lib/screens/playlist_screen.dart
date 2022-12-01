import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/functions/playistfunctions.dart';
import 'package:music_app_main/models/songModel.dart';
import 'package:music_app_main/widgets/playlistedit.dart';
import 'package:music_app_main/widgets/songsinsideplaylist.dart';

class ScreenPlayList extends StatefulWidget {
  const ScreenPlayList({super.key});

  @override
  State<ScreenPlayList> createState() => _ScreenPlayListState();
}

class _ScreenPlayListState extends State<ScreenPlayList> {
  late TextEditingController controller;

  String? title;
  final formkey=GlobalKey<FormState>();
  final existingplaylist=const SnackBar(content: Text('"Playlist name Already Exist',
  style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),
  ),
  backgroundColor: Colors.grey,
  behavior: SnackBarBehavior.floating,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=TextEditingController();
  }


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
        //backgroundColor:const Color.fromARGB(255, 11, 1, 17) ,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          
          centerTitle: true,
          title: Text('Play List',style: GoogleFonts.alef(color:Colors.white,letterSpacing: 1,fontSize: 25)),
          

        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: FloatingActionButton(
            
            onPressed: (){
              showDialog(context: context,
               builder: (context) {
                return Dialog(
                  backgroundColor: Colors.grey,
                  child: SizedBox(
                    height: 150,
                    width: 180,
                    child: Column(
                      children: [
                        Form(
                          key: formkey,
                          child:TextFormField(
                            controller: controller,
                            decoration:const InputDecoration(
                              
                              enabledBorder: UnderlineInputBorder(
                                
                                borderSide: BorderSide(
                                  color: Colors.black
                                )
                              ),
                              
                              hintText: "create playlist"
                            ),
                            onChanged: (value) {
                              title=value.trim();
                            },
                          )),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:Color.fromARGB(255, 77, 76, 76)
                            ),
                            onPressed: (){
                              create();
                            },
                             child:const Text('creat',))
                          ],
                          )
                      ],
                    ),
                  ),
                );
                 
               },);
            },child: Icon(Icons.add_to_photos),
            
            splashColor: const Color.fromARGB(255, 60, 12, 70),
            
            backgroundColor: Colors.grey,),
            
        ),
        body:ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, boxes, _) {
            playlists=box.keys.toList();
            
          
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: playlists.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).
                push(MaterialPageRoute(
                  builder: (context) => songsinsideplaylist(playlistname: playlists[index]),
                  ));
                
              },
              child: playlists[index] !="musics"&&
              playlists[index] !="favorites"&&
              playlists[index] !="recent"&&
              playlists[index] !="mostplaypry"&&
              playlists[index] !="mostplay"
              ?librarylist(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: ListTile(
                  
                  contentPadding: const EdgeInsets.only(right: 10,top: 3,bottom: 3),
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(10)
                  ),
                  tileColor: Colors.grey.withOpacity(0.5),
                  leading: Container(
                    height: 100,
                    width: 100,
                    child: const CircleAvatar(
                      radius: 40,
                      
                      backgroundImage: AssetImage(
                         'assets/images/home/MM433_1200x1200.webp', 
                      ),
                    ),
                  ),
                  title: Text(playlists[index].toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:const TextStyle(
                    fontFamily: "poppinz",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                  ),

                 // subtitle: Text(''),

                 trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      showCupertinoDialog(
                        context: context, 
                        builder: (context) {
                          return playlistedit(playlistnameforedit: playlists[index]);
                        },);
                      
                    }, icon:const Icon(Icons.edit,color: Colors.white,) ),

                    IconButton(
                      onPressed: (){
                        showDialog(
                          context: context, 
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: const Text('Do You Want To Delete'),
                              

                              actions:<Widget> [

                                CupertinoDialogAction(
                                  onPressed: () {
                                    box.delete(playlists[index]);
                                    ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                      content:Text('Deleted Successfully',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      backgroundColor: Colors.grey, 
                                      behavior: SnackBarBehavior.floating,
                                    )
                                    );
                                    setState(() {
                                      playlists=box.keys.toList();
                                    });
                                    Navigator.pop(context);
                                  },
                                  child:const Text('sure',
                                  
                                  )),
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("cancel"))

                              ],
                            );
                            
                          },
                          );
                      },
                     icon:const Icon(Icons.delete,color: Colors.white,) )
                  ],
                 ),
                  
                ),
              )
              ):Container()
              
            ),
           
            );
          }
        ) ,
      ),
    );
  }
  Padding librarylist({required child}){
    return Padding(padding: const EdgeInsets.only(left: 5,right: 5,bottom: 20),
    child: child,
    );
  }
  int listlength({required listname}){
    final g =box.get(listname)!;
    return g.length;
  }

  void create(){
    playlistname=controller.text;
    List<LocalSongs>library=[];
    List?existingname=[];
    if(playlists.isNotEmpty){
      existingname=playlists.where((element) => element==playlistname).toList();
    }

    if(playlistname !=''&&
    existingname.isEmpty&&
    formkey.currentState!.validate()
    ){
      box.put(playlistname, library);
      Navigator.of(context).pop();
      setState(() {
        playlists=box.keys.toList();
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(existingplaylist);
    }
    controller.clear();
  }
}
