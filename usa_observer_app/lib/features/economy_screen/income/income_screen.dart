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
      appBar: AppBar(
        title: const Text('Household Income by State'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(incomeProvider.notifier).refresh(),
        child: switch (state) {
          IncomeLoading() => const Center(child: CircularProgressIndicator()),

          IncomeError(:final message) => ListView(
            children: [
              const SizedBox(height: 200),
              Center(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          IncomeLoaded(:final data) => IncomeContent(data: data),
        },
      ),
    );
  }
}
