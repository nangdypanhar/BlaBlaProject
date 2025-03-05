import 'package:bla_bla_project/screens/rides/widgets/ride_pref_modal.dart';
import 'package:bla_bla_project/service/ride_prefs_service.dart';
import 'package:flutter/material.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/rides_service.dart';
import '../../theme/theme.dart';
import 'rides/widgets/ride_pref_bar.dart';
import 'rides/widgets/rides_tile.dart';

///
///  The Ride Selection screen allow user to select a ride, once ride preferences have been defined.
///  The screen also allow user to re-define the ride preferences and to activate some filters.
///
class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  RidePreference currentPreference = RidePrefService.instance
      .currentPreference!; // TODO 1 :  We should get it from the service

  List<Ride> get matchingRides =>
      RidesService.instance.getRidesFor(currentPreference);

  void onBackPressed() {
    Navigator.of(context).pop(); //  Back to the previous view
  }

  void onPreferencePressed() async {
    // TODO  6 : we should push the modal with the current pref
    final RidePreference? newPreference =
        await Navigator.of(context).push<RidePreference>(
      MaterialPageRoute(
        builder: (context) =>
            RidePrefModal(currentPreference: currentPreference),
      ),
    );
    if (newPreference != null) {
      currentPreference = newPreference;  // TODO 9 :  After pop, we should get the new current pref from the modal
      setState(() {
        RidePrefService.instance.setCurrentPreference(newPreference); // TODO 10 :  Then we should update the service current pref,   and update the view
      });
    }
  }

  void onFilterPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
          left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
      child: Column(
        children: [
          // Top search Search bar
          RidePrefBar(
              ridePreference: currentPreference,
              onBackPressed: onBackPressed,
              onPreferencePressed: onPreferencePressed,
              onFilterPressed: onFilterPressed),

          Expanded(
            child: ListView.builder(
              itemCount: matchingRides.length,
              itemBuilder: (ctx, index) => RideTile(
                ride: matchingRides[index],
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
