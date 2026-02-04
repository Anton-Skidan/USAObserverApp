import 'package:flutter/material.dart';
import 'package:usa_observer_app/network/employment/models/employment_model.dart';

class EmploymentContent extends StatelessWidget {
  const EmploymentContent({super.key, required this.data});

  final List<EmploymentModel> data;

  @override
  Widget build(BuildContext context) {
    final sorted = [...data]..sort((a, b) => a.industry.compareTo(b.industry));

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: sorted.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = sorted[index];

        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Theme.of(context).dividerColor),
          ),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                item.industryId.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ),
            title: Text(
              item.industry,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
