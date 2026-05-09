import 'package:flutter/material.dart';
import '../data/home_data.dart';
import 'stat_block.dart';
import 'archive_card.dart';

class BentoLayout extends StatelessWidget {
  const BentoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;
    final data = HomeData.stats;

    if (!isWide) {
      return Column(
        children: [
          ArchiveCard(title: data[0]['value']!, subtitle: data[0]['label']!, meta: data[0]['meta']),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: ArchiveCard(title: data[1]['value']!, subtitle: data[1]['label']!, meta: data[1]['meta'])),
              const SizedBox(width: 12),
              Expanded(child: StatBlock(text: '${data[2]['value']} ${data[2]['label']}')),
            ],
          ),
          const SizedBox(height: 12),
          ArchiveCard(title: data[3]['value']!, subtitle: data[3]['label']!, meta: data[3]['meta']),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              ArchiveCard(title: data[0]['value']!, subtitle: data[0]['label']!, meta: data[0]['meta']),
              const SizedBox(height: 12),
              ArchiveCard(title: data[3]['value']!, subtitle: data[3]['label']!, meta: data[3]['meta']),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              StatBlock(text: '${data[2]['value']} ${data[2]['label']}'),
              const SizedBox(height: 12),
              ArchiveCard(title: data[1]['value']!, subtitle: data[1]['label']!, meta: data[1]['meta']),
            ],
          ),
        ),
      ],
    );
  }
}