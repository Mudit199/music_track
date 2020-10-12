import 'package:flutter/material.dart';
import 'package:music_track/data/models/api_result.dart';

// ignore: must_be_immutable
class TrackDetailPage extends StatelessWidget {
  TrackList trackList;
  TrackDetailPage({this.trackList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Track Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            child: Text(trackList.track.trackName),
          ),
          Container(
            child: Text(trackList.track.artistName),
          ),
          Container(
            child: Text(trackList.track.albumName),
          ),
          Container(
            child: Text(trackList.track.explicit.toString()),
          ),
          Container(
            child: Text(trackList.track.trackRating.toString()),
          ),
          Container(
            child: Text(trackList.track.hasLyrics.toString()),
          ),
        ],
      ),
    );
  }
}
