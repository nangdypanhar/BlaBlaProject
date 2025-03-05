import 'package:bla_bla_project/model/ride/locations.dart';
import 'package:bla_bla_project/model/ride/ride.dart';
import 'package:bla_bla_project/model/ride_pref/ride_pref.dart';
import 'package:bla_bla_project/model/user/user.dart';
import 'package:bla_bla_project/repository/rides_repository.dart';
import 'package:bla_bla_project/service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  final List<Ride> _rides = [
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.kh),
      departureDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 5, 30),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.kh),
      arrivalDateTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 30),
      driver: User(firstName: 'Kannika', lastName: 'Kannika', phone: "0999999"),
      availableSeats: 2,
      pricePerSeat: 10.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.kh),
      departureDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 8),
      arrivalLocation: Location(name: 'Sieam Reap', country: Country.kh),
      arrivalDateTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 10),
      driver: User(firstName: 'Chaylim', lastName: 'Chaylim', phone: "0999999"),
      availableSeats: 2,
      pricePerSeat: 10.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.kh),
      departureDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 5),
      arrivalLocation: Location(name: 'Sieam Reap', country: Country.kh),
      arrivalDateTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 8),
      driver:
          User(firstName: 'Mengtech', lastName: 'Mengtech', phone: "0999999"),
      availableSeats: 2,
      pricePerSeat: 10.0,
    ),
    Ride(
        departureLocation: Location(name: 'Battambang', country: Country.kh),
        departureDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 20),
        arrivalLocation: Location(name: 'Sieam Reap', country: Country.kh),
        arrivalDateTime: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 22),
        driver: User(firstName: 'Limhoa', lastName: 'Limhoa', phone: "0999999"),
        availableSeats: 2,
        pricePerSeat: 10.0,
        acceptedPets: true),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.kh),
      departureDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 5),
      arrivalLocation: Location(name: 'Sieam Reap', country: Country.kh),
      arrivalDateTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 8),
      driver: User(firstName: 'Sovanda', lastName: 'Sovanda', phone: "0999999"),
      availableSeats: 2,
      pricePerSeat: 10.0,
    ),
  ];

  @override
  List<Ride> getRides(
      RidePreference preference, RidesFilter? filter, RidesSortType? sort) {
    List<Ride> filteredRides = _rides;
    if (filter != null && filter.acceptPets == true) {
      filteredRides = filteredRides
          .where((ride) => ride.acceptedPets == filter.acceptPets)
          .toList();
    }

    if (sort != null && sort.departureDate == true) {
      filteredRides.sort((a, b) => a.departureDate.compareTo(b.departureDate));
    }
    return filteredRides;
  }
}
