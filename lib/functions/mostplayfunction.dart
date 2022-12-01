
import 'package:music_app_main/functions/functions.dart';
// import 'package:music_app_main/functions/recentfunction.dart';
import 'package:music_app_main/models/songModel.dart';
 
List<dynamic>mostplayedlistfun=[];
List mostparylist=[];
List secmost=[];

var mosttemp;
var lasttemp;
//  int? count;


addmostplayed({required int index}){

  
  // if(mostparylist != null){
  //   mostparylist=box.get("mostplaypry")??secmost;
  // }

  if(mostparylist.length<10){
     
    final mostsongs=box.get("musics") as List<LocalSongs>;
    
    
     mosttemp=mostsongs.firstWhere((element) =>
     element.id.toString()==audiosongs[index].metas.id.toString() );

      mostplayedlistfun.add(mosttemp );
    box.put("mostplay", mostplayedlistfun);
    
    if(mostplayedlistfun.length<15){
      int i;
      
      int count=0;
    for( i=0;i<mostplayedlistfun.length;i++){
      
        if(mostplayedlistfun[i]==mosttemp){
          count=count+1;
        
      }
    }
   if(count>=3){

      mostparylist.insert(0,mosttemp);
      box.put("mostplaypry", mostparylist);
    } 
      
    
    }else{
      mostplayedlistfun.removeAt(14);

      box.put('mostplay', mostplayedlistfun);

  }  

  
  
  
  }else{
    mostparylist.removeAt(9);
    box.put("mostplaypry", mostparylist);

   

  }

}
