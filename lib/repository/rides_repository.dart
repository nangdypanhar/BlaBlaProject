import 'package:bla_bla_project/model/ride/ride.dart';
import 'package:bla_bla_project/model/ride_pref/ride_pref.dart';
import 'package:bla_bla_project/service/rides_service.dart';

abstract class RidesRepository {
  List<Ride>getRides (RidePreference preference , RidesFilter? filter);
}