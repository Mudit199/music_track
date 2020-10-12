import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_track/bloc/tracks_block/track_bloc.dart';
import 'package:music_track/bloc/tracks_block/track_event.dart';
import 'package:music_track/bloc/tracks_block/track_state.dart';
import 'package:music_track/data/models/api_result.dart';
import 'package:music_track/track_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TrackListBloc trackListBloc;
  @override
  void initState() {
    super.initState();
    trackListBloc = BlocProvider.of<TrackListBloc>(context);
    trackListBloc.add(FetchTracksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "Trending",
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: Container(
                child: BlocListener<TrackListBloc, TrackState>(
                  listener: (context, state) {
                    if (state is TrackListError) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  child: BlocBuilder<TrackListBloc, TrackState>(
                      builder: (context, state) {
                    if (state is TrackListInitialState) {
                      return buildLoading();
                    } else if (state is TrackListLoadingState) {
                      return buildLoading();
                    } else if (state is TrackListLoadedState) {
                      return buildTrackList(state.trackList);
                    } else if (state is TrackListError) {
                      return buildErrorUi(state.message);
                    }
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(message),
      ),
    );
  }

  Widget buildTrackList(List<TrackList> tracklist) {
    return ListView.builder(
      // itemCount: tracklist.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              leading: Icon(Icons.music_note),
              title: Text(tracklist[index].track.albumName),
              subtitle: Text(tracklist[index].track.trackName),
              trailing: Text(tracklist[index].track.artistName),
            ),
            onTap: () {
              navigateToTrackDetailPage(context, tracklist[index]);
            },
          ),
        );
      },
    );
  }
}

void navigateToTrackDetailPage(BuildContext context, TrackList tracklist) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return TrackDetailPage(
      trackList: tracklist,
    );
  }));
}
