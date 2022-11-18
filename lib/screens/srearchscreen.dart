
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/functions/recentfunction.dart';
import 'package:music_app_main/models/songModel.dart';
import 'package:music_app_main/open%20audio/openaudio.dart';
import 'package:music_app_main/widgets/miniplayer.dart';
import 'package:on_audio_query/on_audio_query.dart';



class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  

  List<LocalSongs> songsdb=[];
  List<Audio> listedsongs=[];
  String searchinput='';

  callboxsongs() {

    songsdb=box.get("musics")as List<LocalSongs>;

    for(var element in songsdb){
      listedsongs.add(
        Audio.file(element.uri.toString(),
        metas: Metas(
          title: element.title,
          artist: element.artist,
          id: element.id.toString(),

        )
        )
      );
    }

  }

  Future <String>  debounce ()async{
    return "waited 1";

  }
  @override
  void initState() {
    // TODO: implement initState
    callboxsongs();
    super.initState();
  }


 
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    List<Audio> searchresult=listedsongs.where((element) =>
    element.metas.title!.toLowerCase().startsWith(searchinput.toLowerCase())
     ).toList();

    return Container(
       decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
         colors:[
                    Color.fromARGB(255, 85, 84, 85) ,
                    Color.fromARGB(255, 130, 130, 130),
                    Color.fromARGB(255, 85, 85, 85) ,
         ]
        ),
      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        appBar: AppBar(
         backgroundColor:Colors.transparent,
          title:const Text('Search',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "poppinz",
            fontSize: 20,
            fontWeight: FontWeight.bold),),
        ),
        body: SafeArea(
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style:const TextStyle(
                    color: Colors.white
                  ),
                  onChanged:(value) {
                    setState(() {
                      searchinput=value;
                    });
                    
                  },
                  
                 cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                  
                    hintText: "Search Here",
                    labelStyle: TextStyle(color: Colors.white),

                    enabledBorder: UnderlineInputBorder(borderSide:BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  
                    suffixIcon: IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    },
                     icon:const Icon(Icons.clear,color: Colors.white,))
                    

                  ),
                  
                ),
              ),
              const SizedBox(height: 10,),
              searchinput.isNotEmpty?searchresult.isNotEmpty?
              Expanded(child: ListView.builder(
                itemCount: searchresult.length,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                    future: debounce(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState==ConnectionState.done){
                        return GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();

                            showBottomSheet(
                              backgroundColor:const Color.fromARGB(255, 11, 1, 17),
                              shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(45),
                                            ),
                              context: context, 
                              builder:(context) =>MiniPlayer(index: index, audiosongs: audiosongs));
                              PlayMyAudio(
                                allSongs: searchresult,
                                 index: index,)
                                 .openAsset(index:index,
                                 audios: audiosongs 
                                 );

                            
                          },
                          child: ListTile(
                            leading: QueryArtworkWidget(id:int .parse(searchresult[index].metas.id!), 
                            type:ArtworkType.AUDIO,
                            nullArtworkWidget: ClipOval(
                              child: Image.asset('assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,

                              ),
                            ),
                            ),
                            title: Text(
                              searchresult[index].metas.title!,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "poppinz",
                                color: Colors.white
                              ), 
                            ),
                            subtitle: Text(
                              searchresult[index].metas.artist!,
                              style: const TextStyle(
                                color: Colors.white
                              ),
                              
                            ),
                          ),
                        );
                      }
                      return Container();
                    },);
                },)
                ):
                const Padding(
                  padding:EdgeInsets.all(30),
                  child: Text('oops..Not Found',
                  style: TextStyle(
                    fontFamily: "poppinz",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                  ): Expanded(
                    child: ListView.builder(
                            shrinkWrap: true,
                               //songlist.length,
                               itemCount: audiosongs.length,
                              itemBuilder: (context, index) {
                              return  ListTile(
                                
                               // leading: Image.asset('assets/images/most.jpg'),
                               leading: QueryArtworkWidget(
                                id: int.parse(audiosongs[index].metas.id.toString()),
                                type: ArtworkType.AUDIO,
                                nullArtworkWidget:Container(
                                //  margin:const EdgeInsets.only(left: 1, right: 10,),
                                 width: size.width*0.15,
                                 height:size.height*0.09 ,
                                 //color: Colors.amber,
                                 //color: Colors.amber,
                                 child: ClipRRect(
                     borderRadius: const BorderRadius.all(
                       Radius.circular(30),
                     ),
                     child: Image.asset(
                       'assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg',
                       fit: BoxFit.cover,
                       alignment: Alignment.bottomRight,
                     ),
                                 ),
                                ),
                               ) ,
                                title: Text(
                    // songlist[index].metas.title.toString(),
                    audiosongs[index].metas.title.toString(),
                    maxLines: 1,
                    style:const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                                ),
                                subtitle: Text(
                    // songlist[index].metas.artist.toString(),
                                audiosongs[index].metas.artist.toString()==
                                '<unknown>'?'unknown':audiosongs[index].metas.artist.toString(),
                                maxLines: 1,
                    style:const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),),
                          
                          onTap: () async{

                      PlayMyAudio(
                        allSongs: audiosongs, 
                        index: index,)
                        .openAsset(index: index,
                        audios: audiosongs);
                        addrecent(index: index);
                        

                        
                  showBottomSheet(
                    
                    backgroundColor:Colors.transparent,
                    
                    
                     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(35),),
       
                 
                  
                    context: context, 
                    builder: (ctx) => 
                    
                    // MiniPlayer(
                    //   index: index,
                    //    audiosongs: audiosongs),
                    
                       MiniPlayer(index: index,
                        audiosongs: audiosongs,
                        
                        ),
                    
                       );




                     
                        
                  },
                  
                              );
                              }
                    ),
                  )
            ],
          ) ,
        ),
      ),
    );
  }
}