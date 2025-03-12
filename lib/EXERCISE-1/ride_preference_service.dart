import 'package:bla_bla_project/model/ride/locations.dart';
import 'package:bla_bla_project/model/ride_pref/ride_pref.dart';

import 'ride_preference_listener.dart';

class RidePreferenceService {

  RidePreference _ridePreference = RidePreference(
      departure: Location(name: "Sieam Reap", country: Country.kh),
      departureDate: DateTime.now(),
      arrival: Location(name: "Phnom Penh", country: Country.kh),
      requestedSeats: 1);
      
  final List<RidePreferencesListener> _listeners = [];

  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void setRidePreference(RidePreference newPreference) {
     _ridePreference = newPreference;
     _notifyListeners();
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.onPreferenceChanged(_ridePreference);
    }
  }
}

class ConsoleLogger extends RidePreferencesListener {
  @override
  void onPreferenceChanged(RidePreference selectedPrefence) {
    print('Preference has been changed to: $selectedPrefence');
  }
}
