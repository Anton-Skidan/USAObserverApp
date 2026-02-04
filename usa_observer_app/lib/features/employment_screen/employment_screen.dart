import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usa_observer_app/features/employment_screen/state_notifier/notifier.dart';
import 'package:usa_observer_app/features/employment_screen/views/employment_content.dart';

class EmploymentScreen extends ConsumerWidget {
  const EmploymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employmentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employment by Industry'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(employmentProvider.notifier).refresh(),
        child: switch (state) {
          EmploymentLoading() => const Center(
            child: CircularProgressIndicator(),
          ),

          EmploymentError(:final message) => ListView(
            children: [
              const SizedBox(height: 200),
              Center(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),

          EmploymentLoaded(:final data) => EmploymentContent(data: data),
        },
      ),
    );
  }
}
