
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app_main/models/boxmodel.dart';
import 'package:music_app_main/models/songModel.dart';
import 'package:music_app_main/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalSongsAdapter());
  await Hive.openBox<List>(boxname);
  final box=Boxes.getinstence();



  List? favoritesnew= box.keys.toList();
  if(!favoritesnew.contains('favorites')){
    List<dynamic> favoritelist=[];
    box.put('favorites', favoritelist);
  }
  List? recentBox= box.keys.toList();
  if(!favoritesnew.contains('recent')){
    List<dynamic> recentslist=[];
    box.put('recent', recentslist);
  }

  // List? mostbox=box.keys.toList();
  // if(!favoritesnew.contains('mostplay')){
  //   List<dynamic>mostplaylist=[];
  //   box.put('mostplay', mostplaylist);
  // }



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M U Z I R A',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: const ScreenSplash()
    );
  }
}

