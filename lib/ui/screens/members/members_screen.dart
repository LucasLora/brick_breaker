import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'members_viewmodel.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MembersViewModel>();
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cs.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: cs.onSurface),
        title: Text(
          'Integrantes',
          style: tt.titleLarge?.copyWith(
            color: cs.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: vm.members.length,
        separatorBuilder: (_, __) => Divider(color: cs.outlineVariant),
        itemBuilder: (context, index) {
          final member = vm.members[index];
          return ListTile(
            title: Text(
              member,
              style: tt.bodyLarge?.copyWith(
                color: cs.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              child: Text(member[0]),
            ),
          );
        },
      ),
    );
  }
}
