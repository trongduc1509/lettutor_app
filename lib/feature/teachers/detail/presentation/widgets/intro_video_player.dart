import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../base/theme/colors.dart';

class IntroVidPlayer extends StatefulWidget {
  const IntroVidPlayer({
    Key? key,
    required this.vidUrl,
  }) : super(key: key);

  final String vidUrl;

  @override
  State<IntroVidPlayer> createState() => _IntroVidPlayerState();
}

class _IntroVidPlayerState extends State<IntroVidPlayer> {
  late VideoPlayerController _vidController;

  @override
  void initState() {
    super.initState();
    _vidController = VideoPlayerController.network(widget.vidUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) => _vidController.value.isInitialized
      ? Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            AspectRatio(
              aspectRatio: _vidController.value.aspectRatio,
              child: VideoPlayer(
                _vidController,
              ),
            ),
            IconButton(
              icon: Icon(
                _vidController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white.withOpacity(0.8),
              ),
              onPressed: () {
                setState(() {
                  _vidController.value.isPlaying
                      ? _vidController.pause()
                      : _vidController.play();
                });
              },
            ),
          ],
        )
      : Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor().greyBackground,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CupertinoActivityIndicator(),
              SizedBox(
                height: 10.0,
              ),
              Text('Loading introduction video...'),
            ],
          ),
        );
}
