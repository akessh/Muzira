import 'package:flutter/material.dart';
import 'package:music_app_main/functions/functions.dart';
import 'package:music_app_main/functions/playistfunctions.dart';
import 'package:music_app_main/models/boxmodel.dart';
import 'package:music_app_main/models/songModel.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongAdd extends StatefulWidget {
   SongAdd({super.key,required this .playlistname});
  String playlistname;

  @override
  State<SongAdd> createState() => _SongAddState();
}

class _SongAddState extends State<SongAdd> {
  final box=Boxes.getinstence();

  @override
  void initState() {
    // TODO: implement initState
    
    getsongs();
  }
  getsongs(){
    databasesongs=box.get("musics") as List<LocalSongs>;
    playlistsongmodel=box.get(widget.playlistname)!.cast<LocalSongs>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
      child: ListView.builder(
        itemCount: databaseSongs.length,
        itemBuilder: (context, index) {
        return Padding(padding: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: SizedBox(
            height: 45,
            width: 45,
            child: QueryArtworkWidget(
              id:databaseSongs[index].id! ,
               type: ArtworkType.AUDIO,
               artworkBorder: BorderRadius.circular(15),
               artworkFit: BoxFit.cover,
               nullArtworkWidget: Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/home/282775792_551198669707007_1507136733228624337_n.jpg'),
                    fit: BoxFit.cover
                    )
                ),
               ),
               ),
          ),
          title: Text(databaseSongs[index].title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: "poppinz",
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 15
          ),
          ),
          trailing: playlistsongmodel.where((element) => 
          element.id.toString()==databaseSongs[index].id.toString()
          ).isEmpty?IconButton(onPressed: ()async{
            playlistsongmodel.add(databaseSongs[index]);
            await box.put(widget.playlistname, playlistsongmodel);
            setState(() {
              
            });
          }, icon: const Icon(Icons.add)):
          IconButton(onPressed: ()async{
            playlistsongmodel.removeWhere((element) => element.id.toString()==
            databaseSongs[index].id.toString());
          }, icon: const Icon(Icons.remove))
        ),
        );
      },),
    );
  }
}