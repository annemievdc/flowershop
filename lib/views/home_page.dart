import 'dart:async';

import 'package:flowershop/models/review.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/widgets/page_title.dart';
import 'package:flowershop/widgets/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController videoController = VideoPlayerController.asset(
    'assets/videos/morticia_bouquet.mp4',
  );
  bool isVisible = false;
  Timer? buttonsTimer;
  late Review review;

  @override
  void initState() {
    super.initState();
    videoController.setLooping(true);
    videoController.setVolume(1.0);
    videoController.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!videoController.value.isInitialized) {
      return const Center(
        child: Stack(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 6,
                color: AppTheme.mutedPurple,
                backgroundColor: AppTheme.darkSlate,
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.darkSlate,
              backgroundImage: AssetImage('assets/images/skull.png'),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        PageTitleBox(title: "Welkom duister ziel"),

        Expanded(
          flex: 5,
          child: GestureDetector(
            onTap: toonKnoppen,
            child: Stack(
              alignment: Alignment.center,

              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: AspectRatio(
                    aspectRatio: 640 / 320,
                    child: VideoPlayer(videoController),
                  ),
                ),
                if (isVisible)
                  IconButton(
                    iconSize: 80,
                    color: AppTheme.boneWhite,
                    icon: Icon(
                      videoController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {
                        videoController.value.isPlaying
                            ? videoController.pause()
                            : videoController.play();
                      });
                      toonKnoppen();
                    },
                  ),
              ],
            ),
          ),
        ),
        Expanded(flex: 2, child: ReviewWidget()),
      ],
    );
  }

  //laat de play en pauze weer verdwijnen
  void toonKnoppen() {
    setState(() {
      isVisible = true;
    });
    buttonsTimer?.cancel(); //reset timer
    buttonsTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          isVisible = false;
        });
      }
    });
  }

  //disposen van timer en video
  @override
  void dispose() {
    buttonsTimer?.cancel();
    videoController.dispose();
    super.dispose();
  }
}
