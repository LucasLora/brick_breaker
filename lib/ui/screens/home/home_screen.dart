import 'package:brick_breaker/ui/screens/members/members_screen.dart';
import 'package:brick_breaker/ui/screens/members/members_viewmodel.dart';
import 'package:brick_breaker/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Brick Breaker',
          style: tt.titleLarge?.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(vm.soundOn ? Icons.volume_up : Icons.volume_off),
            tooltip: vm.soundOn ? 'Som: ligado' : 'Som: desligado',
            onPressed: vm.toggleSound,
          ),
          IconButton(
            icon: Icon(Icons.people_alt_rounded),
            tooltip: 'Integrantes',
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider(
                    create: (_) => MembersViewModel(),
                    child: const MembersScreen(),
                  ),
                ),
              ),
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Brick Breaker',
                  style: tt.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Um jogo simples para o Projeto Integrador VI A',
                  textAlign: TextAlign.center,
                  style: tt.bodyMedium?.copyWith(color: cs.onSurface),
                ),
                const SizedBox(height: 48),
                AppButton(
                  label: 'Nível 1: Padrão',
                  onPressed: () => {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => ChangeNotifierProvider(
                    //       create: (_) => GameViewModel(),
                    //       child: const GameScreen(level: 1),
                    //     ),
                    //   ),
                    // ),
                  },
                ),
                const SizedBox(height: 12),
                AppButton(
                  label: 'Nível 2: Semi aleatório',
                  onPressed: () => {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => ChangeNotifierProvider(
                    //       create: (_) => GameViewModel(),
                    //       child: const GameScreen(level: 2),
                    //     ),
                    //   ),
                    // ),
                  },
                ),
                const SizedBox(height: 12),
                AppButton(
                  label: 'Nível 3: Aleatório',
                  onPressed: () => {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => ChangeNotifierProvider(
                    //       create: (_) => GameViewModel(),
                    //       child: const GameScreen(level: 3),
                    //     ),
                    //   ),
                    // ),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
