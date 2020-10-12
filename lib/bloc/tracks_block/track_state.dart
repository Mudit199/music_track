import 'package:equatable/equatable.dart';
import 'package:music_track/data/models/api_result.dart';
import 'package:meta/meta.dart';

abstract class TrackState extends Equatable {}

class TrackListInitialState extends TrackState {
  @override
  List<Object> get props => [];
}

class TrackListLoadingState extends TrackState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class TrackListLoadedState extends TrackState {
  List<TrackList> trackList;
  TrackListLoadedState({@required this.trackList});

  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class TrackListError extends TrackState {
  String message;
  TrackListError({@required this.message});
  @override
  List<Object> get props => null;
}
