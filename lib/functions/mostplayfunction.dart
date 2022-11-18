

import 'package:flutter/material.dart';
import 'package:music_app_main/functions/functions.dart';
// import 'package:music_app_main/functions/recentfunction.dart';
import 'package:music_app_main/models/songModel.dart';
 
List<dynamic>mostplayedlistfun=[];
List<dynamic>mostparylist=[];

var mosttemp;
var lasttemp;
 int count=1;

addmostplayed({required int index}){

  if(mostplayedlistfun.length<10){
    
    final mostsongs=box.get("musics") as List<LocalSongs>;

     mosttemp=mostsongs.firstWhere((element) =>
     element.id.toString()==audiosongs[index].metas.id.toString() );
    
   
    mostplayedlistfun.insert(0,mosttemp );
    box.put("mostplay", mostplayedlistfun);
    

    // if (mostplayedlist.contains(temp)){
    //   mostplayedprylist.insert(0, temp);
    //   box.put("mostpry", mostplayedprylist);
    // }

  }else{
    mostplayedlistfun.removeAt(9);
    box.put("mostplay", mostplayedlistfun);

   


  //  mostplayedlist.forEach((dup) {
  //  if( mostplayedlist.contains(dup["mostplay"])){
  //    mostplayedprylist.insert(0, mostplayedlist);
  //  box.put("mostpry", mostplayedprylist);

  //  }
  //  });
  

  }

}