import 'package:bla_bla_project/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidesScreen extends StatelessWidget {
  final RidePref ridePref;

  const RidesScreen({super.key, required this.ridePref});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ride Preferences for ${ridePref.departure}"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Departure : ${ridePref.departure}"),
            Text("DepartureDate : ${ridePref.departureDate}"),
            Text("Arrival : ${ridePref.arrival}"),
            Text("Seats : ${ridePref.requestedSeats}"),
          ],
        ));
  }
}
