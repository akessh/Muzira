


import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';

import 'package:music_app_main/models/boxmodel.dart';
import 'package:music_app_main/models/songModel.dart';
import 'package:on_audio_query/on_audio_query.dart';

// song fectching-->

List<SongModel> allSongs=[];
final box= Boxes.getinstence();

final _audioquery=OnAudioQuery();
List<Audio>audiosongs=[];
List<LocalSongs> mappedsongs =[];
List<LocalSongs> databaseSongs =[];
List? databasesongs =[];

//favourites---->
List<Audio>PlayLikedSong=[];
// List<LocalSongs> Likedsongsmodel = [];
//final likedSongs = box.get("favorites");
List<dynamic> favorites = [];

//recents--->
List<dynamic>recents=[];
List<dynamic>?recentsongscop=[];

//most played-------->
// List<dynamic>mostplayed=[];
// List<dynamic>mostplayedsongscop=[];


fectchingSongs()async{
  bool ispermission =await _audioquery.permissionsStatus();
  if(!ispermission){
    await _audioquery.permissionsRequest();
  }
  allSongs = await _audioquery.querySongs();
  mappedsongs =allSongs.map((e)
   => LocalSongs
   (title: e.title,
    artist: e.artist, 
    id: e.id,
     uri:e.uri!, 
     duration: e.duration))
     .toList();
     
     await box.put("musics",mappedsongs);
     databaseSongs=box.get('musics') as List<LocalSongs>;

     databaseSongs.forEach((element) {
      audiosongs.add(Audio.file(element.uri.toString(),
      metas: Metas(
        title: element.title,
        id: element.id.toString(),
        artist: element.artist
      )
      ));
     });
}

//song find and get id---->
Audio find(List<Audio> source,String fromPath){
  return source.firstWhere((element) => element.path==fromPath);
  
}
//asset audio player--->
AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer.withId('0');

//recent songs add--------->
// addrecent({required int index}){
  
//   if(recents.length<20){

//     final songs = box.get("musics") as List<LocalSongs>;

//     final temp=songs.firstWhere((element) =>
//      element.id.toString()==audiosongs[index].metas.id.toString());

//       recents.insert(0,temp);
//      box.put("recent",recents);

     
//   }else{
//     recents.removeAt(19);
//     box.put("recent",recents);
//   }
//   // addmostplayed(index: index);
  
// }

//mostplayed songs add--------->

// addmostplayed({required int index}){
// if(mostplayed.length<15){
//   final mostsongs= box.get("musics") as List<LocalSongs>;

//   final mosttemp=mostsongs.firstWhere((element) => 
//   element.id.toString()==audiosongs[index].metas.id.toString());

//   mostplayed.insert(0,mosttemp);
//   box.put("mostplay", mostplayed);
// }else{
//   mostplayed.removeAt(14);
//   box.put("mostplay", mostplayed);
// }
// }

//Playlist-->
// List playlists=[];
// String? playlistname='';

// List<dynamic>?playlistsongs=[];

// List<Audio> playlistplay=[];

// List<LocalSongs>playlistsongmodel=[];

    
  




