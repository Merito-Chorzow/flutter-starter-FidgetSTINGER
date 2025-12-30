import 'dart:io';
import 'package:flutter/material.dart';
import '../models/journal_entry.dart';

class EntryDetailView extends StatelessWidget {
  const EntryDetailView({super.key});

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final entry = ModalRoute.of(context)!.settings.arguments as JournalEntry;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Szczegóły wpisu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Header
            if (entry.imagePath != null && entry.imagePath!.isNotEmpty)
              SizedBox(
                width: double.infinity,
                height: 250,
                child: entry.imagePath!.startsWith('assets/')
                    ? Image.asset(entry.imagePath!, fit: BoxFit.cover)
                    : Image.file(File(entry.imagePath!), fit: BoxFit.cover),
              )
            else
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey[200],
                child: Icon(Icons.image, size: 64, color: Colors.grey[400]),
              ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Text(
                        _formatDate(entry.date),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Title
                  Text(
                    entry.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  Text(
                    entry.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 32),

                  // Location Card
                  if (entry.latitude != null && entry.longitude != null)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blue.withOpacity(0.1)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.location_on, color: Colors.blue, size: 28),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lokalizacja',
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[900],
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${entry.latitude!.toStringAsFixed(6)}, ${entry.longitude!.toStringAsFixed(6)}',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Colors.blue[800],
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
