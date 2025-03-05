import 'package:bla_bla_project/model/ride_pref/ride_pref.dart';
import 'package:bla_bla_project/repository/rides_repository.dart';
import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> availableRides = fakeRides;
   
   RidesRepository repository;
   static RidesService? _instance;

   RidesService._internal(this.repository);

 static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("RideService is already initialized.");
    }
  }

    static RidesService get instance {
    if (_instance == null) {
		  throw Exception("RidePreferencesService is not initialized. Call initialize() first.");
		}
		return _instance!;
  }


  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
    List<Ride> getRidesFor(RidePreference preferences,{ RidesFilter? filter, RidesSortType? sort}) {
      return repository.getRides(preferences, filter, sort);
  }
}

class RidesFilter {
  final bool acceptPets;
  const RidesFilter({this.acceptPets = false});
}


class RidesSortType{
  final bool departureDate;
  const RidesSortType({this.departureDate = false});
}