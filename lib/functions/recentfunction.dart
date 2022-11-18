
//import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/models/songModel.dart';


List<dynamic>recents=[];
//List<dynamic>?recentsongscop=[];
//List<dynamic>mostplayedlist1=[];

var temp;
var mosttemp;
int count=1;
addrecent({required int index}){

 if( recents.contains(mosttemp)){

  count=count+1;

 }
  
  if(recents.length<20){

    final songs = box.get("musics") as List<LocalSongs>;
    if(recents.contains(temp)){
      mosttemp=temp;
    }
    

     temp=songs.firstWhere((element) =>
     element.id.toString()==audiosongs[index].metas.id.toString());

     
     if(recents.contains(temp)){
      recents.remove(temp);
      recents.insert(0, temp);
     }else{
      recents.insert(0,temp);
     box.put("recent",recents);
  }
     
  }else{
    recents.removeAt(19);
    box.put("recent",recents);
  }
 

  
}

