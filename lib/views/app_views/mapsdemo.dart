import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMapPage extends StatefulWidget {
  final String location;
  final String dateTime;
  //final String imagePath;

  const LocationMapPage({
    super.key,
    required this.location,
    required this.dateTime,
    //required this.imagePath,
  });

  @override
  _LocationMapPageState createState() => _LocationMapPageState();
}

class _LocationMapPageState extends State<LocationMapPage> {
  // Add variables and controllers for the Google Map
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(0.0, 0.0), // Default initial position
    zoom: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _initialPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: <Marker>{
                const Marker(
                  markerId: MarkerId('report_location'),
                  position: LatLng(0.0, 0.0), // Set the actual location here
                  infoWindow: InfoWindow(
                    title: 'Report Location',
                  ),
                ),
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Location: ${widget.location}'),
                Text('Date and Time: ${widget.dateTime}'),
                //Image.asset(
                //widget.imagePath,
                //width: 150, // Adjust the width as needed
                //height: 150, // Adjust the height as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationMapPage extends StatefulWidget {
  const LocationMapPage({super.key});

  @override
  _LocationMapPageState createState() => _LocationMapPageState();
}

class _LocationMapPageState extends State<LocationMapPage> {
  GoogleMapController? mapController;
  Location location = Location();
  LatLng? userLocation;

  @override
  void initState() {
    super.initState();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        userLocation =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Map Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0), // Initial map location
                zoom: 10.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              markers: userLocation != null
                  ? {
                      Marker(
                        markerId: const MarkerId("UserLocation"),
                        position: userLocation!,
                        infoWindow: const InfoWindow(title: "User Location"),
                      )
                    }
                  : {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter a location...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Implement location search and update the map accordingly
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with the actual item count
              itemBuilder: (context, index) {
                // Build your list item here
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/
