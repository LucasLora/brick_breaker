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
