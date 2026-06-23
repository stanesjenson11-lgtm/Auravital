import 'package:flutter/material.dart';

class RecommendationsList extends StatelessWidget {
  const RecommendationsList({required this.items, super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in items)
          Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.tips_and_updates),
              title: Text(item),
            ),
          ),
      ],
    );
  }
}
