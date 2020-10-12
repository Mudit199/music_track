import 'package:equatable/equatable.dart';

abstract class TrackEvent extends Equatable {}

class FetchTracksEvent extends TrackEvent {
  @override
  List<Object> get props => null;
}
