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

  final List<PinnedLocation> pinnedLocations = [
    PinnedLocation(
      name1: 'Location 1',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.6844,
      longitude1: 73.0479,
      status: 'Completed',
      reportedBy: 'Maryam Ashfaq',
    ),
    PinnedLocation(
      name1: 'Location 2',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.7229,
      longitude1: 73.0781,
      status: 'In Progress',
      reportedBy: 'Abdullah',
    ),
    PinnedLocation(
      name1: 'Location 3',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.6631,
      longitude1: 73.0687,
      status: 'Completed',
      reportedBy: 'Asiya',
    ),
    PinnedLocation(
      name1: 'Location 4',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.7420,
      longitude1: 73.1208,
      status: 'In Progress',
      reportedBy: 'Aima',
    ),
    PinnedLocation(
      name1: 'Location 5',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.6875,
      longitude1: 73.0369,
      status: 'In Progress',
      reportedBy: 'Danish',
    ),
    PinnedLocation(
      name1: 'Location 6',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.6693,
      longitude1: 73.0598,
      status: 'Completed',
      reportedBy: 'Ayra',
    ),
    PinnedLocation(
      name1: 'Location 7',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.7181,
      longitude1: 73.0756,
      status: 'In Progress',
      reportedBy: 'Fatima',
    ),
    PinnedLocation(
      name1: 'Location 8',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.6810,
      longitude1: 73.0479,
      status: 'In Progress',
      reportedBy: 'Zaynab',
    ),
    PinnedLocation(
      name1: 'Location 9',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.6891,
      longitude1: 73.0486,
      status: 'Completed',
      reportedBy: 'Hammaad',
    ),
    PinnedLocation(
      name1: 'Location 10',
      image1: 'assets/garbagedemo.png',
      latitude1: 33.7242,
      longitude1: 73.0816,
      status: 'In Progress',
      reportedBy: 'Ashfaq',
    ),
    // Add more locations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        title: const Text('Pinned Locations'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AppRoutes.profileview);
          },
        ),
      ),
      body: Column(
        children: [
          // Add the heading
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Clean ups around you!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xff1473b9),
              ),
            ),
          ),
          Container(
            height: 300, // Set the height for the map container
            padding:
                const EdgeInsets.all(16), // Add padding to the map container
            child: GoogleMap(
              onMapCreated: (mapController) {
                setState(() {
                  _mapController = mapController;
                });
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(
                  33.6844, // Latitude of Islamabad
                  73.0479, // Longitude of Islamabad
                ),
                zoom: 12, // You can adjust the zoom level as needed
              ),
              mapType: MapType.normal,
              markers: _buildMarkers(),
            ),
          ),
          Expanded(
            child: _buildLocationList(),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 80, // Set the width to make the FAB larger
        height: 80, // Set the height to make the FAB larger
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

  Widget _buildLocationList() {
    return ListView.builder(
      itemCount: pinnedLocations.length,
      itemBuilder: (context, index) {
        final location = pinnedLocations[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(location.name1),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Latitude: ${location.latitude1}, Longitude: ${location.longitude1}',
                ),
                Text(
                  'Status: ${location.status}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: location.status == 'Completed'
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
                if (location.reportedBy.isNotEmpty) ...[
                  const Text(
                    'Reported by:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(location.reportedBy), // Display the single name
                ],
              ],
            ),
            leading: Image.asset(
              location.image1,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Set<Marker> _buildMarkers() {
    final Set<Marker> markers = {};
    for (var location in pinnedLocations) {
      markers.add(
        Marker(
          markerId: MarkerId(location.name1),
          position: LatLng(location.latitude1, location.longitude1),
          infoWindow: InfoWindow(title: location.name1),
        ),
      );
    }
    return markers;
  }
}

class PinnedLocation {
  final String name1;
  final String image1;
  final double latitude1;
  final double longitude1;
  final String status;
  final String reportedBy;

  PinnedLocation({
    required this.name1,
    required this.image1,
    required this.latitude1,
    required this.longitude1,
    required this.status,
    required this.reportedBy,
  });
}
