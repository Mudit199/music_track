import 'package:bloc/bloc.dart';
import 'package:music_track/bloc/tracks_block/track_event.dart';
import 'package:music_track/bloc/tracks_block/track_state.dart';
import 'package:music_track/data/models/api_result.dart';
import 'package:music_track/data/repositories/track_repository.dart';
import 'package:meta/meta.dart';

class TrackListBloc extends Bloc<TrackEvent, TrackState> {
  TrackRepository repository;

  TrackListBloc({@required this.repository}) : super(null);

  TrackState get initialState => TrackListInitialState();

  @override
  Stream<TrackState> mapEventToState(TrackEvent event) async* {
    if (event is FetchTracksEvent) {
      yield TrackListLoadedState(trackList: null);
      try {
        List<TrackList> trackList = await repository.getTracks();
        yield TrackListLoadedState(trackList: trackList);
      } catch (e) {
        yield TrackListError(message: e.toString());
      }
    }
  }
}
