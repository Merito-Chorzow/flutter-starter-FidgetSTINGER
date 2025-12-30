import 'dart:io';
import 'package:flutter/material.dart';
import '../../models/journal_entry.dart';

class EntryTile extends StatelessWidget {
  final JournalEntry entry;
  final VoidCallback onTap;
  const EntryTile({super.key, required this.entry, required this.onTap});

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    Widget? imageWidget;
    if (entry.imagePath != null && entry.imagePath!.isNotEmpty) {
      if (entry.imagePath!.startsWith('assets/')) {
        imageWidget = Image.asset(entry.imagePath!, width: 80, height: 80, fit: BoxFit.cover);
      } else {
        imageWidget = Image.file(File(entry.imagePath!), width: 80, height: 80, fit: BoxFit.cover);
      }
    } else {
      imageWidget = Container(
        width: 80,
        height: 80,
        color: Colors.grey[200],
        child: const Icon(Icons.location_on, color: Colors.grey, size: 32),
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: imageWidget,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(entry.date),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (entry.latitude != null && entry.longitude != null)
                      Row(
                        children: [
                          const Icon(Icons.map, size: 14, color: Colors.blue),
                          const SizedBox(width: 4),
                          Text(
                            '${entry.latitude!.toStringAsFixed(4)}, ${entry.longitude!.toStringAsFixed(4)}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
