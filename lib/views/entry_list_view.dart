import 'package:flutter/material.dart';
import '../models/journal_entry.dart';
import '../services/api_service.dart';
import 'widgets/entry_tile.dart';
import 'widgets/loading_widget.dart';
import 'widgets/error_widget.dart';
import 'widgets/empty_state_widget.dart';

class EntryListView extends StatefulWidget {
  const EntryListView({super.key});

  @override
  State<EntryListView> createState() => _EntryListViewState();
}

class _EntryListViewState extends State<EntryListView> {
  final ApiService _apiService = ApiService();
  late Future<List<JournalEntry>> _entriesFuture;

  @override
  void initState() {
    super.initState();
    _refreshEntries();
  }

  void _refreshEntries() {
    setState(() {
      _entriesFuture = _apiService.fetchEntries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geo Journal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.pushNamed(context, '/add');
              _refreshEntries();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<JournalEntry>>(
        future: _entriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasError) {
            return ErrorWidgetCustom(message: snapshot.error.toString());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const EmptyStateWidget(message: 'No entries. Add your first one!');
          }

          final entries = snapshot.data!;

          return RefreshIndicator(
            onRefresh: () async => _refreshEntries(),
            child: ListView.builder(
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
        },
      ),
    );
  }
}
