import 'package:music_track/data/models/api_result.dart';
import 'package:http/http.dart' as http;
import 'package:music_track/res/strings.dart';
import 'dart:convert';

abstract class TrackRepository {
  Future<List<TrackList>> getTracks();
}

class TrackRepositoryImplementation implements TrackRepository {
  @override
  Future<List<TrackList>> getTracks() async {
    var response = await http.get(AppStrings.trackListUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<TrackList> trackList = Body.fromJson(data).trackList;
      return trackList;
    } else {
      throw Exception();
    }
  }
}
