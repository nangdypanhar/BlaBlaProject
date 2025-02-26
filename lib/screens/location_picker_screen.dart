import 'package:bla_bla_project/dummy_data/dummy_data.dart';
import 'package:bla_bla_project/model/ride/locations.dart';
import 'package:bla_bla_project/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final TextEditingController searchController = TextEditingController();
  List<Location> filteredLocations = [];
  bool clearBtn = false;

  @override
  void initState() {
    super.initState();
    filteredLocations = fakeLocations;
  }

  void filterLocations(String query) {
    setState(() {
      filteredLocations = fakeLocations
          .where((location) =>
              location.name.toLowerCase().contains(query.toLowerCase()) ||
              location.country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      clearBtn = false;
      filteredLocations = List.from(fakeLocations);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: BlaColors.greyLight,
                prefixIcon: Icon(Icons.search),
                suffixIcon: clearBtn
                    ? IconButton(
                        onPressed: clearSearch,
                        icon: Icon(Icons.clear),
                      )
                    : null,
                hintText: "Search",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                filterLocations(value);
                setState(() {
                  clearBtn = value.isNotEmpty;
                });
              },
            ),
          ),
          filteredLocations.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: filteredLocations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredLocations[index].name,
                            style: TextStyle(color: BlaColors.neutralDark)),
                        subtitle: Text(filteredLocations[index].country.name,
                            style: TextStyle(color: BlaColors.neutralLighter)),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {},
                      );
                    },
                  ),
                )
              : Text("No matches place")
        ],
      ),
    );
  }
}
