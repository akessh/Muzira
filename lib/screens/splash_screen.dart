



import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/screens/mainscreen.dart';


//import 'package:music_app/screens/home_screen.dart';


class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

 


 
  @override
  void initState() {
    gotohome();
    fectchingSongs();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
     Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        
                       height: size.height*1,
                        width: double.infinity,
                      // color: const Color.fromARGB(255, 14, 2, 21),
                      //  child: Image.asset('assets/images/splash/d101fb7302fd3812dc42c13493613ebb.jpg',fit: BoxFit.cover,)
                        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/splash/d101fb7302fd3812dc42c13493613ebb.jpg"),
        fit: BoxFit.cover),
      ),
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.only(top:size.height*0.2),
          child:const Text('Listen To Music \n   You Actully Like',style: TextStyle(color: Colors.white,fontSize: 25,),),
        ),

        Padding(
          padding:  EdgeInsets.only(bottom: size.height*0.1),
          child:const Text('M U Z I R A',style: TextStyle(color: Colors.white,fontSize: 18,),),
        )
      ],
        ),
      )
                      
                     
                      
                     ),
      
    //   backgroundColor: const Color.fromARGB(255, 14, 2, 21),
    //   body: Center(
    //     child: Column(
    //       children: [
    //         Container(
    //           width: double.infinity,
    //           decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [
    //             Color.fromARGB(255, 42, 8, 61),
    //             Color.fromARGB(255, 11, 1, 17)
    //           ])),
    //           child: Column(
    //             children: [
    //                                 SizedBox(height:size.height*0.2 ),
    //               Padding(
    //                 padding: const EdgeInsets.only(
                    
    //                   left: 10,
    //                   right: 10
    //                   ),
    //                 child: Container(
    //                   // height: 784,
    //                   // width: 1739,
    //                  // color: const Color.fromARGB(255, 14, 2, 21),
    //                   child: Image.asset('assets/images/splash/LD0005760785_1-removebg-preview-removebg-preview.png',height:size.height*0.3,)
                      
                      
    //                 ),
                    
    //               ),
    //                                 SizedBox(height:size.height*0.07 ),
    //               Padding(
    //                 padding:const  EdgeInsets.only(left: 25,right: 25),
    //                 child:  Text('Listen To Music You\n      Actually Like',style: GoogleFonts.acme(color:Colors.white,letterSpacing: 1,fontSize: 25),
                    
    //                 ),
    //               ),
    //               SizedBox(height:size.height*0.22 ),

    //               Padding(
    //                 padding: const EdgeInsets.only(left: 12,right: 12),
    //                 child: Text('M U Z I R A',style:GoogleFonts.aBeeZee(color: Colors.white70,fontSize: 15,letterSpacing: 2),),
    //               )
    //               ,
    //               SizedBox(height:size.height*0.094 ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    
     );
  }

  Future<void>gotohome()async{
    await Future.delayed(const Duration(seconds: 5));
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => screenmain(),));
  }

 
}