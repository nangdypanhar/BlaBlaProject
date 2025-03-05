import 'package:bla_bla_project/model/ride/locations.dart';
import 'package:bla_bla_project/model/ride_pref/ride_pref.dart';
import 'package:bla_bla_project/repository/mock/mock_rides_repository.dart';
import 'package:bla_bla_project/service/rides_service.dart';

void main() {
  RidesService.initialize(MockRidesRepository());

  final currentPref1 = RidePreference(
      departure: Location(name: "Battambang", country: Country.kh),
      departureDate: DateTime.now(),
      arrival: Location(name: "Sieam Reap", country: Country.kh),
      requestedSeats: 1);

  var result1 = RidesService.instance.getRidesFor(currentPref1);

  var result2 = RidesService.instance.getRidesFor(currentPref1,filter: RidesFilter(acceptPets: true));
  print(result2);
  print(result1);
}
