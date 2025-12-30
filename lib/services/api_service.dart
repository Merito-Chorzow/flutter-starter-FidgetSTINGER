import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/journal_entry.dart';

class ApiService {
  static const String baseUrl = 'https://example.com/api/entries';

  // Mock data for presentation - static to persist across instances
  static final List<JournalEntry> _mockEntries = [
    JournalEntry(
      id: '1',
      title: 'Spacer w parku',
      description: 'Piękna pogoda, dużo słońca.',
      date: DateTime.now().subtract(const Duration(days: 1)),
      latitude: 52.2297,
      longitude: 21.0122,
    ),
    JournalEntry(
      id: '2',
      title: 'Wycieczka w góry',
      description: 'Widoki były niesamowite.',
      date: DateTime.now().subtract(const Duration(days: 2)),
      latitude: 49.2992,
      longitude: 19.9496,
    ),
  ];

  Future<List<JournalEntry>> fetchEntries() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // For real API, uncomment the following block:
    /*
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => JournalEntry.fromJson(e)).toList();
    } else {
      throw Exception('Error fetching entries');
    }
    */

    return _mockEntries;
  }

  Future<void> addEntry(JournalEntry entry) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // For real API, uncomment the following block:
    /*
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(entry.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Error adding entry');
    }
    */

    _mockEntries.add(entry);
  }
}
