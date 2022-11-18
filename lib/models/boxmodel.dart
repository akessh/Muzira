import 'package:hive/hive.dart';
import 'package:music_app_main/models/songModel.dart';

String boxname='songs';

class Boxes {
  static Box<List>? _box;


  static Box<List>getinstence(){
    return _box ??Hive.box(boxname);
  }



}