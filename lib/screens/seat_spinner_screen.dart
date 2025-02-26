import 'package:bla_bla_project/theme/theme.dart';
import 'package:flutter/material.dart';

class SeatSpinnerScreen extends StatefulWidget {
  const SeatSpinnerScreen({super.key});

  @override
  State<SeatSpinnerScreen> createState() => _SeatSpinnerScreenState();
}

class _SeatSpinnerScreenState extends State<SeatSpinnerScreen> {
  int count = 1;

  void removeSeat() {
    if (count > 1) {
      setState(() {
        count -= 1;
      });
    }
  }

  void addSeat() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.clear),
                color: BlaColors.primary),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Number of Seats to book ",
                  style: BlaTextStyles.heading),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: count > 1
                            ? BlaColors.primary
                            : BlaColors.greyLight),
                  ),
                  child: IconButton(
                    onPressed: () => removeSeat(),
                    icon: Icon(Icons.remove,
                        color: count > 1
                            ? BlaColors.primary
                            : BlaColors.greyLight),
                  ),
                ),
                Text(
                  '$count',
                  style: BlaTextStyles.heading,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: BlaColors.primary),
                  ),
                  child: IconButton(
                    onPressed: () => addSeat(),
                    icon: Icon(Icons.add, color: BlaColors.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
