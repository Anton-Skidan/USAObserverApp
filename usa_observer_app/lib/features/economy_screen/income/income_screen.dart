import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usa_observer_app/features/economy_screen/income/state_notifier/notifier.dart';
import 'package:usa_observer_app/features/economy_screen/income/views/views.dart';

class IncomeScreen extends ConsumerWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(incomeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Median Income'), centerTitle: true),
      body: RefreshIndicator(
        onRefresh: () => ref.read(incomeProvider.notifier).refresh(),
        child: switch (state) {
          IncomeLoading() => const Center(child: CircularProgressIndicator()),

          IncomeError(:final errorMessage) => ListView(
            children: [
              const SizedBox(height: 200),
              Center(child: Text(errorMessage)),
            ],
          ),

          IncomeLoaded(:final data) => IncomeContent(data: data),
        },
      ),
    );
  }
}
