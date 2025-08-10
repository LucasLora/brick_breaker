import 'package:brick_breaker/ui/screens/members/members_screen.dart';
import 'package:brick_breaker/ui/screens/members/members_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/screens/home/home_screen.dart';
import 'ui/screens/home/home_viewmodel.dart';

void main() {
  runApp(const BrickBreakerApp());
}

class BrickBreakerApp extends StatelessWidget {
  const BrickBreakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brick Breaker',
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.dark().textTheme,
          ).apply(bodyColor: Colors.white, displayColor: Colors.white),
          colorScheme: ColorScheme.dark(
            primary: Colors.grey.shade800,
            onPrimary: Colors.white,
            surface: Colors.grey.shade900,
            onSurface: Colors.white,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeScreen(),
          '/members': (_) => ChangeNotifierProvider(
            create: (_) => MembersViewModel(),
            child: const MembersScreen(),
          ),
          //Todo: '/game': (_) => const GameScreen(),
        },
      ),
    );
  }
}
