import 'dart:async';
import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:care_nest/features/entertainment/data/models/get_music_response.dart';

class MusicPlayer {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final StreamController<Duration> _durationController =
      StreamController<Duration>.broadcast();
  final StreamController<Duration> _positionController =
      StreamController<Duration>.broadcast();
  final StreamController<void> _playerCompleteController =
      StreamController<void>.broadcast();

  Stream<Duration> get onDurationChanged => _durationController.stream;
  Stream<Duration> get onPositionChanged => _positionController.stream;
  Stream<void> get onPlayerComplete => _playerCompleteController.stream;

  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<void>? _completeSubscription;

  MusicPlayer() {
    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      if (!_durationController.isClosed) {
        _durationController.add(duration);
      }
    });

    _positionSubscription = _audioPlayer.onPositionChanged.listen((position) {
      if (!_positionController.isClosed) {
        _positionController.add(position);
      }
    });

    _completeSubscription = _audioPlayer.onPlayerComplete.listen((_) {
      if (!_playerCompleteController.isClosed) {
        _playerCompleteController.add(null);
      }
    });
  }

  Future<void> playAudio(MusicData music) async {
    try {
      await _audioPlayer.stop(); 
      await _audioPlayer.play(UrlSource(music.audio));
    } catch (e) {
      log('Error playing audio: $e');
    }
  }

  void stopAudio() async {
    await _audioPlayer.stop();
  }

  void dispose() {
    stopAudio();
    _audioPlayer.release();

    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _completeSubscription?.cancel();

    _durationController.close();
    _positionController.close();
    _playerCompleteController.close();
  }
}
