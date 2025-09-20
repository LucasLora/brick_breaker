import 'package:brick_breaker/ui/screens/settings/settings_viewmodel.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ui/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await FlameAudio.audioCache.loadAll([
    'brick.mp3',
    'game_over.mp3',
    'level_beat.mp3',
  ]);
  runApp(const BrickBreakerApp());
}

class BrickBreakerApp extends StatelessWidget {
  const BrickBreakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SettingsViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brick Breaker',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.dark(
            primary: Colors.grey.shade800,
            onPrimary: Colors.white,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
