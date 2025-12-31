import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../models/journal_entry.dart';

class MapWidget extends StatelessWidget {
  final List<JournalEntry> entries;
  const MapWidget({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: entries.isNotEmpty && entries.first.latitude != null && entries.first.longitude != null
            ? LatLng(entries.first.latitude!, entries.first.longitude!)
            : const LatLng(52.2297, 21.0122), // Warszawa
        initialZoom: 10.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.geojournal',
        ),
        MarkerLayer(
          markers: entries
              .where((e) => e.latitude != null && e.longitude != null)
              .map((e) => Marker(
                    width: 40.0,
                    height: 40.0,
                    point: LatLng(e.latitude!, e.longitude!),
                    child: const Icon(Icons.location_pin, color: Colors.red, size: 36),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
