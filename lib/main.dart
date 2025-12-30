import 'package:flutter/material.dart';
import 'views/entry_list_view.dart';
import 'views/add_entry_view.dart';
import 'views/entry_detail_view.dart';

void main() {
  runApp(const GeoJournalApp());
}

class GeoJournalApp extends StatelessWidget {
  const GeoJournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geo Journal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const EntryListView(),
        '/add': (context) => const AddEntryView(),
        '/detail': (context) => const EntryDetailView(),
      },
    );
  }
}
