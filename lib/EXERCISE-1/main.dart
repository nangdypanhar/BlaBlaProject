import 'package:bla_bla_project/EXERCISE-1/ride_preference_service.dart';
import 'package:bla_bla_project/model/ride/locations.dart';
import 'package:bla_bla_project/model/ride_pref/ride_pref.dart';

void main (){
    RidePreferenceService ridePreferenceService = RidePreferenceService();
    ConsoleLogger consoleLogger = ConsoleLogger();
    
  final RidePreference ridePreference = RidePreference(
      departure: Location(name: "Sieam Reap", country: Country.kh),
      departureDate: DateTime.now(),
      arrival: Location(name: "Koh Kong", country: Country.kh),
      requestedSeats: 1);

    ridePreferenceService.addListener(consoleLogger);
    ridePreferenceService.setRidePreference(ridePreference);


}