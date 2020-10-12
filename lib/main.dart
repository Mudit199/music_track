import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_track/bloc/tracks_block/track_bloc.dart';
import 'package:music_track/data/repositories/track_repository.dart';
import 'package:music_track/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Player",
      home: BlocProvider(
        create: (context) =>
            TrackListBloc(repository: TrackRepositoryImplementation()),
        child: HomePage(),
      ),
    );
  }
}
