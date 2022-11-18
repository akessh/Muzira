import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkify/linkify.dart';
import 'package:music_app_main/functions/functions.dart';

bool temp=true;

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {

  bool islight=true;


static bool togglenotificationon({required bool isnotificationon}){

  isnotificationon?
  assetsAudioPlayer.showNotification=true
  :assetsAudioPlayer.showNotification=false;
  assetsAudioPlayer.showNotification?temp=true:temp=false; 

  return temp;
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   // Size size =MediaQuery.of(context).size;
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
          title: Text('Settings',style: GoogleFonts.alef(color:Colors.white,letterSpacing: 1,fontSize: 23)),
        ),
        body: ListView(
          children: [
            ListTile(
              leading:const Icon(Icons.notifications,color: Colors.white,),
              title:const Text('Notifications',style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),fontWeight:FontWeight.bold),),
                    trailing: Switch(
                  focusColor:const Color.fromARGB(255, 146, 145, 146),
                  activeColor:const Color.fromARGB(255, 54, 54, 54),
                  value: islight,
                  onChanged: (value) {
                    bool temp=value;
                    temp=togglenotificationon(isnotificationon: value);
                    setState(() {
                      islight = temp;
                    });
                  }),
            ),
             ListTile(
              leading:const Icon(Icons.share,color: Colors.white,),
              title:const Text('Share',style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),fontWeight:FontWeight.bold),),
                      onTap: () {
                        
                      },
            ),
             ListTile(
              leading:const Icon(Icons.gavel,color: Colors.white,),
              title: const Text('Terms And Conditions',style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight:FontWeight.bold),),
                      onTap:() {
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                          return const LicensePage(
                            applicationIcon: Text('M U Z I R A'),
                            applicationVersion: '1.0.0',
                          );
                        },
                          

                        ));
                        
                      },
            ),
             ListTile(
              leading:const Icon(Icons.info_outline,color: Colors.white,),
              title:const Text('About us',style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),fontWeight:FontWeight.bold),),
                      onTap: () {
                        showCupertinoDialog(
                          context: context, 
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Column(
                            children:const [
                              Text('M U Z I R A',
                              style:  TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                              ),
                               Text('1.0.0')
                            ],
                          ),
                          content: const Text('MUZIRA is designed and developed by\n AKESH K'),
                           actions: <Widget>[
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK',),
                            )
                           ],
                        );
                        
                      },);
                        
                      },
            ),
               ListTile(
              leading: const Icon(Icons.lock,color: Colors.white,),
              title:const Text('Privacy Policy',style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),fontWeight:FontWeight.bold),),
                      onTap: () {
                       // Share.share('https://www.freeprivacypolicy.com/live/bc67dc5c-6950-4601-9f53-47cbdbc8ff4d');
                      // launch('https://www.freeprivacypolicy.com/live/bc67dc5c-6950-4601-9f53-47cbdbc8ff4d');
                      linkify("https://www.freeprivacypolicy.com/live/bc67dc5c-6950-4601-9f53-47cbdbc8ff4d");
                      },
            )
          ],
        ),
      ),
    );
  }
}