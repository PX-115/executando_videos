import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late VideoPlayerController _controller;
  
  String url = "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4";

  _pausar(){
    _controller.pause();
  }

  @override
    void initState() {
      super.initState();
      /*_controller = VideoPlayerController.network(url)..initialize().then((_){
        setState(() {
            _controller.play();      
        });
      });*/

      _controller = VideoPlayerController.asset(
        "assets/videos/cancel_demon.mp4"
        )
        ..setLooping(true)
        ..initialize().then((_){
        setState(() {
          //_controller.play();


        });
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Executando vídeos"),
      ),

      body: Center(
        child: _controller.value.isInitialized 
        ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller), 
        )
        : Text("Pressione o botão play")
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();            
          });
        },

        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}