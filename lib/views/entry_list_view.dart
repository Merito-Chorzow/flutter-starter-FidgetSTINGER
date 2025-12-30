import 'package:flutter/material.dart';
import '../models/journal_entry.dart';
import 'widgets/entry_tile.dart';

class EntryListView extends StatelessWidget {
  const EntryListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Static list for initial commit
    final List<JournalEntry> entries = [
      JournalEntry(
        id: '1',
        title: 'First Entry',
        description: 'This is a static entry for testing UI.',
        date: DateTime.now(),
        latitude: 52.2297,
        longitude: 21.0122,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Geo Journal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return EntryTile(
            entry: entries[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: entries[index],
              );
            },
          );
        },
      ),
    );
  }
}
