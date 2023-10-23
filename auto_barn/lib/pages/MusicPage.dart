import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: const Text('Music'),
          ),
      body: Center(
        child: const Text('This is the music screen'),
      ),
    );
  }
}
