import 'package:brick_breaker/ui/screens/settings/settings_viewmodel.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:vibration/vibration.dart';

class FeedbackHelper {
  static Future<void> playSound(SettingsViewModel settings, String file) async {
    if (settings.soundOn) {
      FlameAudio.play(file);
    }
  }

  static Future<void> vibrate(
    SettingsViewModel settings, {
    int duration = 500,
  }) async {
    if (settings.vibrationOn && await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: duration);
    }
  }
}
