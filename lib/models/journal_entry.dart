class JournalEntry {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final double? latitude;
  final double? longitude;
  final String? imagePath;

  JournalEntry({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.latitude,
    this.longitude,
    this.imagePath,
  });

  factory JournalEntry.fromJson(Map<String, dynamic> json) => JournalEntry(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date: DateTime.parse(json['date']),
        latitude: json['latitude'],
        longitude: json['longitude'],
        imagePath: json['imagePath'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'date': date.toIso8601String(),
        'latitude': latitude,
        'longitude': longitude,
        'imagePath': imagePath,
      };
}
