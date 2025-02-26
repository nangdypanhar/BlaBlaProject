import 'dart:ui';

import 'package:bla_bla_project/theme/theme.dart';
import 'package:bla_bla_project/widgets/actions/bla_button.dart';
import 'package:bla_bla_project/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;
  final FocusNode _focusNodeLocation = FocusNode();

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          customInputField(
              hintText: "Location",
                icon: Icon(Icons.circle_outlined),
              onTap: () {},
              focusNode: _focusNodeLocation),
          BlaDivider(),
          SizedBox(height: 10),
          customInputField(
              hintText: "Destination",
              icon: Icon(Icons.circle_outlined),
              onTap: () {},
              focusNode: _focusNodeLocation),
          BlaDivider(),
          SizedBox(height: 10),
          customInputField(
              hintText: "Today",
              icon: Icon(Icons.calendar_month_rounded),
              onTap: () {},
              focusNode: _focusNodeLocation),
          BlaDivider(),
          SizedBox(height: 10),
           customInputField(
            hintText: "Passenger",
            icon: Icon(Icons.person_outline_sharp),
            onTap: () {},
            focusNode: _focusNodeLocation
          ),
          SizedBox(height: 10),
          BlaButton(text: "Search", onPressed: () {}),
        ],
      ),
    );
  }
}

Widget customInputField({
  required FocusNode focusNode,
  required String hintText,
  required Icon icon,
  required VoidCallback onTap,
}) {
  return 
   Material(
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(
        onTap: onTap,
        focusNode: focusNode,
        readOnly: true,
        decoration: InputDecoration(
            prefixIcon: Icon(icon.icon, color: BlaColors.neutralDark),
            hintText: hintText,
            hintStyle: TextStyle(color: BlaColors.neutralDark),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
            filled: true,
            fillColor: focusNode.hasFocus ? Colors.grey[200] : Colors.white,
            border: InputBorder.none),
      ),
    );
}
