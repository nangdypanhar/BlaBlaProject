import 'package:bla_bla_project/model/ride/locations.dart';
import '../../utils/date_time_util.dart';
import '../user/user.dart';

enum RideStatus {
  created,
  published,
  ongoing,
  finished;
}

///
/// This model describes a  Ride.
///
class Ride {
  final Location departureLocation;
  final DateTime departureDate;

  final Location arrivalLocation;
  final DateTime arrivalDateTime;

  final User driver;

  final int availableSeats;
  final double pricePerSeat;
  final bool? acceptedPets;

  RideStatus status = RideStatus.created;

  final List<User> passengers = [];

  Ride(
      {required this.departureLocation,
      required this.departureDate,
      required this.arrivalLocation,
      required this.arrivalDateTime,
      required this.driver,
      required this.availableSeats,
      required this.pricePerSeat,
      this.acceptedPets = false});

  String get duration {
    final duration = arrivalDateTime.difference(departureDate);
    final hours = duration.inHours;

    return '${hours}h';
  }

  void addPassenger(User passenger) {
    passengers.add(passenger);
  }

  int get remainingSeats => availableSeats - passengers.length;

  @override
  String toString() {
    return 'Ride from $departureLocation at ${DateTimeUtils.formatDateTime(departureDate)} '
        'to $arrivalLocation '  
        'Duration: $duration'  
        '  Accept Pet: $acceptedPets'
        '  User: $driver';
  }
}
