import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'songModel.g.dart';



@HiveType(typeId: 0)
class LocalSongs extends HiveObject{
  @HiveField(0)
   String? title; 

   @HiveField(1)
   String? artist;

   @HiveField(2)
   int? id;

   @HiveField(3)
   String? uri;

   @HiveField(4)
   int? duration;
   
   @HiveField(5)
   int? count;

   LocalSongs({
    required this.title,
    required this.artist,
    required this.id,
    required this.uri,
    required this.duration,
    this.count=0,
   });


}