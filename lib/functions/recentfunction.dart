
//import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/models/songModel.dart';



 List recents=[];
 //List recentsmain=[];



var temp;
 

addrecent({required int index}){

  if(recents!=null){
    recents=box.get("recent")!;
  }
  
  if(recents.length<20){

    final songs = box.get("musics") as List<LocalSongs>;
    // if(recents !=null){
    //   recents=box.get("recent");
    // }
   
    //recents=box.get("recent")!;
    // if(recents.contains(temp)){
    //   mosttemp=temp;
    // }
    

     temp=songs.firstWhere((element) =>
     element.id.toString()==audiosongs[index].metas.id.toString());

    
     if(recents.contains(temp)){
      recents.remove(temp);
      recents.insert(0,temp);
      box.put("recent", recents);
     }else{
      recents.insert(0,temp);
     box.put("recent",recents);
  }
     
  }else{
    recents.removeAt(19);
    box.put("recent",recents);
  
  
 }
 
  
}

