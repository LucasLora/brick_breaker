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
      backgroundColor: cs.surface,
      appBar: AppBar(
        backgroundColor: cs.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: cs.onSurface),
        title: Text(
          'Brick Breaker',
          style: tt.titleLarge?.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: vm.soundOn ? 'Som: ligado' : 'Som: desligado',
            onPressed: vm.toggleSound,
            icon: Icon(
              vm.soundOn ? Icons.volume_up : Icons.volume_off,
              color: cs.onSurface,
            ),
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
                  label: 'Iniciar Jogo',
                  onPressed: () =>
                      {}, //Todo: Navigator.pushNamed(context, '/game'),
                ),
                const SizedBox(height: 12),
                AppButton(
                  label: 'Integrantes',
                  onPressed: () => Navigator.pushNamed(context, '/members'),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nível: ',
                      style: tt.bodyLarge?.copyWith(color: cs.onSurface),
                    ),
                    const SizedBox(width: 8),
                    DropdownButton<int>(
                      dropdownColor: Theme.of(context).colorScheme.surface,
                      value: vm.selectedLevel,
                      style: tt.bodyLarge?.copyWith(color: cs.onSurface),
                      items: const [
                        DropdownMenuItem(value: 1, child: Text('1')),
                        DropdownMenuItem(value: 2, child: Text('2')),
                        DropdownMenuItem(value: 3, child: Text('3')),
                      ],
                      onChanged: (v) {
                        if (v != null) vm.setLevel(v);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
