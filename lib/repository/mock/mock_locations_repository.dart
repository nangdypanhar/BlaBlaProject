import 'package:bla_bla_project/model/ride/locations.dart';
import 'package:bla_bla_project/repository/locations_repository.dart';

class MockLocationsRespository extends LocationsRepository {
  
  List<Location> locations = [
    Location(name: 'Phnom Penh', country: Country.kh),
    Location(name: 'Siem Reap', country: Country.kh),
    Location(name: 'Battambang', country: Country.kh),
    Location(name: 'Sihanoukville', country: Country.kh),
    Location(name: 'Kampot', country: Country.kh),
  ];

  @override
  List<Location> getLocations() => locations;
}
