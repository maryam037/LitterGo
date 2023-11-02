import 'package:flutter/material.dart';
import 'package:fypscreensdemo/constants/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GoogleMapController? _mapController;
  bool _showCompletedMarkers = false;
  bool _showInProgressMarkers = false;
  final List<PinnedLocation> pinnedLocations = [
    PinnedLocation(
      name: 'Location 1',
      image: 'assets/s1.jpg',
      latitude: 33.6844,
      longitude: 73.0479,
      status: 'Completed',
      reportedBy: 'Maryam Ashfaq',
      size: 'Fits in a wheelbarrow',
      type: 'Organic',
    ),
    PinnedLocation(
      name: 'Location 2',
      image: 'assets/s2.jpg',
      latitude: 33.7229,
      longitude: 73.0781,
      status: 'In Progress',
      reportedBy: 'Abdullah',
      size: 'Truck needed',
      type: 'Construction',
    ),
    PinnedLocation(
      name: 'Location 3',
      image: 'assets/s3.jpg',
      latitude: 33.6631,
      longitude: 73.0687,
      status: 'Completed',
      reportedBy: 'Asiya',
      size: 'Fit in a bag',
      type: 'Household',
    ),
    PinnedLocation(
      name: 'Location 4',
      image: 'assets/s4.jpg',
      latitude: 33.7420,
      longitude: 73.1208,
      status: 'In Progress',
      reportedBy: 'Aima',
      size: 'Fits in a wheelbarrow',
      type: 'Plastic',
    ),
    PinnedLocation(
      name: 'Location 5',
      image: 'assets/s5.jpg',
      latitude: 33.6875,
      longitude: 73.0369,
      status: 'In Progress',
      reportedBy: 'Danish',
      size: 'Truck needed',
      type: 'Organic',
    ),
    PinnedLocation(
      name: 'Location 6',
      image: 'assets/s6.jpg',
      latitude: 33.6693,
      longitude: 73.0598,
      status: 'Completed',
      reportedBy: 'Ayra',
      size: 'Fit in a bag',
      type: 'Dangerous',
    ),
    PinnedLocation(
      name: 'Location 7',
      image: 'assets/s7.jpg',
      latitude: 33.7181,
      longitude: 73.0756,
      status: 'In Progress',
      reportedBy: 'Fatima',
      size: 'Fits in a wheelbarrow',
      type: 'Glass',
    ),
    PinnedLocation(
      name: 'Location 8',
      image: 'assets/s8.jpg',
      latitude: 33.6810,
      longitude: 73.0479,
      status: 'In Progress',
      reportedBy: 'Zaynab',
      size: 'Fit in a bag',
      type: 'Animal waste',
    ),
    PinnedLocation(
      name: 'Location 9',
      image: 'assets/s9.jpg',
      latitude: 33.6891,
      longitude: 73.0486,
      status: 'Completed',
      reportedBy: 'Hammaad',
      size: 'Fits in a wheelbarrow',
      type: 'Other/Mix',
    ),
    PinnedLocation(
      name: 'Location 10',
      image: 'assets/s10.jpg',
      latitude: 33.7242,
      longitude: 73.0816,
      status: 'In Progress',
      reportedBy: 'Ashfaq',
      size: 'Truck needed',
      type: 'Construction',
    ),
    // Add more locations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        title: const Text('LitterGo Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(
                AppRoutes.profileview); // Use pop instead of pushNamed
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome to LitterGo',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xff1473b9),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'View cleanup efforts in Islamabad',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff1473b9),
              ),
            ),
            Container(
              height: 400,
              padding: const EdgeInsets.all(16),
              child: GoogleMap(
                onMapCreated: (mapController) {
                  setState(() {
                    _mapController = mapController;
                  });
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(33.6844, 73.0479),
                  zoom: 12,
                ),
                mapType: MapType.normal,
                markers:
                    _buildMarkersByStatus(), // Updated to call method directly
              ),
            ),
            const Text(
              'View Reports',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: Color(0xff1473b9),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showCompletedMarkers = false;
                      _showInProgressMarkers = false;
                    });
                  },
                  child: const Text('All'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        !_showCompletedMarkers && !_showInProgressMarkers
                            ? Colors.red
                            : null,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showCompletedMarkers = true;
                      _showInProgressMarkers = false;
                    });
                  },
                  child: const Text('Completed'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _showCompletedMarkers ? Colors.green : null,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showInProgressMarkers = true;
                      _showCompletedMarkers = false;
                    });
                  },
                  child: const Text('In Progress'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _showInProgressMarkers ? Colors.orange : null,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pinnedLocations.length,
                itemBuilder: (context, index) {
                  final location = pinnedLocations[index];
                  return SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the radius as needed
                      ),
                      child: ListTile(
                        title: Text(
                          location.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            color: Color(0xff1473b9),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              'Litter Size: ${location.size},\nLitter Type: ${location.type}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1,
                                color: Color(0xff4daddf),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Status: ${location.status}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                height: 1,
                                color: location.status == 'Completed'
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Reported by: ${location.reportedBy}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                height: 1,
                                color: Color(0xff4daddf),
                              ),
                            ),
                          ],
                        ),
                        leading: Image.asset(
                          location.image,
                          width: 75,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.report);
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Set<Marker> _buildMarkersByStatus() {
    final Set<Marker> markers = {};
    for (var location in pinnedLocations) {
      if (_showCompletedMarkers && location.status == 'Completed') {
        markers.add(
          Marker(
            markerId: MarkerId(location.name),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(title: location.name),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen,
            ),
          ),
        );
      } else if (_showInProgressMarkers && location.status == 'In Progress') {
        markers.add(
          Marker(
            markerId: MarkerId(location.name),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(title: location.name),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange,
            ),
          ),
        );
      } else if (!_showCompletedMarkers && !_showInProgressMarkers) {
        markers.add(
          Marker(
            markerId: MarkerId(location.name),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(title: location.name),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ),
        );
      }
    }
    return markers;
  }
}

class PinnedLocation {
  final String name;
  final String image;
  final double latitude;
  final double longitude;
  final String status;
  final String reportedBy;
  final String size; // Added attribute for size
  final String type; // Added attribute for type

  PinnedLocation({
    required this.name,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.reportedBy,
    required this.size,
    required this.type,
  });
}
