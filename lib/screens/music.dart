import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:audioplayer/audioplayer.dart';
import 'dart:convert' as musicObj;
import '../models/songmodel.dart';
class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  List<Song> songs = [];
  String _songName = '';

//  initState(){
//    super.initState();
//    _callServer();
//  }

  _callServer([String artistName]) async {
    String url = "https://itunes.apple.com/search?term=$artistName&limit=25";
    print('_callServer method called..');
      Response response = await get(url);
      print('Server response is ${response.body}');
      Map<String, dynamic> map = musicObj.jsonDecode(response.body);
      var allSongs = map['results'];
      allSongs.forEach((singleSong){
            Song song = new Song(singleSong['trackname'],singleSong['artworkUrl100'],
                singleSong['previewUrl'],singleSong['artistName']);
        songs.add(song);
      });
      setState(() {
        songs = songs;
      });
  }
  AudioPlayer audioPlayer = new AudioPlayer();
 _playSong(Song song){
   audioPlayer.stop();
   if(!song.isPlaying) {
     audioPlayer.play(song.audio);
   }
 }
 _stopSong(){
   audioPlayer.stop();
 }
  _listChild(Song song){
    return ListTile(
      leading: Image.network(song.photo),
      title: Text(song.title),
      subtitle: Text(song.artistName),
      trailing: IconButton(
        icon: Icon(
          song.isPlaying?Icons.pause_circle_filled:Icons.play_circle_filled,
          size: 40,
          color: Colors.redAccent,
        ),
        onPressed: (){
          _playSong(song);
          setState(() {
            song.isPlaying = !song.isPlaying;

            songs.forEach((currentSong){
              if(currentSong != song){
                currentSong.isPlaying = false;
              }
            });
          });

        },
      ),
    );
  }

  var media;
  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    var buttonSize = 100;

    return Scaffold(
      appBar: AppBar(
        //title: Text('Music Player'),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Container(
                //width: 300,
                width: media.width - buttonSize,
                padding: EdgeInsets.all(5),
                child: TextField(
                  onChanged: (String str) {
                    _songName = str;
                    print('Change call $_songName');
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.search, size: 24, color: Colors.black),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Artist Name',
                    hintStyle: TextStyle(fontSize: 23, color: Colors.black),
                  ),
                ),
              ),
              Container(
                color: Colors.black45,
                margin: EdgeInsets.all(1),
                child: RaisedButton(
                  color: Colors.grey,
                  onPressed: () {
                    _callServer(_songName);
                  },
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.yellowAccent,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(itemBuilder: (ctx, index){ //creates a scrollable, linear array of widgets
          return _listChild(songs[index]);
        },itemCount: songs.length,
        ),
      )
    );
  }
}
