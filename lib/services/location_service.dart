import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return _getKatowicePosition();
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return _getKatowicePosition();
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return _getKatowicePosition();
      }
      // Dodano timeout 5 sekund, aby uniknąć zawieszenia aplikacji na emulatorze
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        timeLimit: const Duration(seconds: 5),
      );
    } catch (e) {
      // W przypadku błędu lub timeoutu zwracamy domyślną lokalizację
      return _getKatowicePosition();
    }
  }

  Position _getKatowicePosition() {
    // Domyślna lokalizacja: Katowice, Polska
    return Position(
      latitude: 50.2649,
      longitude: 19.0238,
      timestamp: DateTime.now(),
      accuracy: 10.0,
      altitude: 260.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0,
      isMocked: true,
    );
  }
}
