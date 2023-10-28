import 'package:flutter/material.dart';
import 'package:fypscreensdemo/constants/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  LatLng? _selectedLocation;
  Position? _userLocation; // Store the user's current location

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // Function to get the user's current location
  void _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _userLocation =
            LatLng(position.latitude, position.longitude) as Position?;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        title: const Text('Locating Litter dump'),
        backgroundColor: const Color(0xff1473b9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AppRoutes.report);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'REPORT NOW',
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xff1473b9),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Pin the location of Litter Dump spotted',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff1473b9),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 450, // Adjust the height as needed
                child: GoogleMap(
                  onMapCreated: (controller) {
                    setState(() {
                      _controller = controller;
                    });
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(
                      33.6844, // Latitude of Islamabad
                      73.0479, // Longitude of Islamabad
                    ),
                    zoom: 12, // You can adjust the zoom level as needed
                  ),
                  mapType: MapType.normal, // Use satellite view
                  markers: _selectedLocation == null
                      ? {}
                      : {
                          Marker(
                            markerId: const MarkerId('user-selected-location'),
                            position: _selectedLocation!,
                          ),
                        },
                  onTap: _selectLocation,
                ),
              ),
              const SizedBox(height: 20),
              if (_selectedLocation != null)
                Text(
                  'Selected Location:\n Latitude   ${_selectedLocation!.latitude}\n Longitude   ${_selectedLocation!.longitude}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff1473b9),
                  ),
                ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.tracking);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xff1473b9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0, 4.0),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: Color(0xffffffff),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectLocation(LatLng latLng) {
    setState(() {
      _selectedLocation = latLng;
    });
  }

  void _goToSelectedLocation() {
    if (_selectedLocation != null) {
      _controller?.animateCamera(CameraUpdate.newLatLng(_selectedLocation!));
    }
  }
}
