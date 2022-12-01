


import 'package:assets_audio_player/assets_audio_player.dart';


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

List<dynamic> favorites = [];



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

//fav
List <dynamic> likedsongs=[];

//playlist







