import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usa_observer_app/features/population_screen/state_notifier/notifier.dart';
import 'package:usa_observer_app/features/population_screen/views/views.dart';

class PopulationScreen extends ConsumerWidget {
  const PopulationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(populationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Population')),
      body: RefreshIndicator(
        onRefresh: () => ref.read(populationProvider.notifier).refresh(),
        child: switch (state) {
          PopulationLoading() => const Center(
            child: CircularProgressIndicator(),
          ),

          PopulationError(:final message) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 120),
              Center(child: Text(message)),
            ],
          ),

          PopulationLoaded(:final data) => PopulationList(data),

          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}
