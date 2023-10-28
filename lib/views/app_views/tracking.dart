import 'package:flutter/material.dart';
import 'package:fypscreensdemo/constants/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  GoogleMapController? _controller;
  final LatLng _reportedSite = const LatLng(33.47708099258762,
      73.19609345257265); // Replace with the reported site coordinates
  final LatLng _disposalSite = const LatLng(
      33.6844, 73.0479); // Replace with the disposal site coordinates
  LatLng? _userLocation;

  final Set<Marker> _markers = <Marker>{}; // Use Set<Marker> for markers

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // Function to get the user's current location and add markers
  void _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);

        // Add user location marker
        _markers.add(
          Marker(
            markerId: const MarkerId('Cleaning Truck Location'),
            position: _userLocation!,
            infoWindow: const InfoWindow(title: 'Cleaning Truck Location'),
          ),
        );

        // Add reported site marker
        _markers.add(
          Marker(
            markerId: const MarkerId('Reported Site'),
            position: _reportedSite,
            infoWindow: const InfoWindow(title: 'Reported Site'),
          ),
        );

        // Add disposal site marker
        _markers.add(
          Marker(
            markerId: const MarkerId('Disposal Site'),
            position: _disposalSite,
            infoWindow: const InfoWindow(title: 'Disposal Site'),
          ),
        );
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  // Function to move the camera to a specific location
  void _moveCamera(LatLng target) {
    if (_controller != null) {
      _controller!.animateCamera(CameraUpdate.newLatLng(target));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        title: const Text('Tracking Cleanup'),
        backgroundColor: const Color(0xff1473b9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AppRoutes.reportmap);
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
                'TRACK NOW',
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xff1473b9),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Track the location of the cleaning truck',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff1473b9),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 400,
                child: GoogleMap(
                  onMapCreated: (controller) {
                    setState(() {
                      _controller = controller;
                    });
                  },
                  initialCameraPosition: CameraPosition(
                    target: _reportedSite,
                    zoom: 15,
                  ),
                  mapType: MapType.normal,
                  markers: _markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _moveCamera(_reportedSite);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1473b9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Reported Site',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 10), // Add some spacing between buttons
                  ElevatedButton(
                    onPressed: () {
                      _moveCamera(_disposalSite);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1473b9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Disposal Site',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_userLocation != null) {
                        _moveCamera(_userLocation!);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1473b9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Cleaning Truck',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.feedback);
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
                            'Feedback',
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
            ],
          ),
        ),
      ),
    );
  }
}
