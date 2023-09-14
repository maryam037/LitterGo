//https://universe.roboflow.com/college-k6ehm/trash-detection-hdig9/model/2
//TH SERVER DOESN'T RESPOND WITH THE RESULT, WILL TRY TO SOLVE IT AGAIN IN THE END
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class ImagedetectionPage extends StatefulWidget {
  const ImagedetectionPage({super.key});

  @override
  _ImagedetectionPageState createState() => _ImagedetectionPageState();
}

class _ImagedetectionPageState extends State<ImagedetectionPage> {
  TextEditingController imagePathController = TextEditingController();
  String predictionResult = '';
  bool isPredictionButtonDisabled = true; // Initially, disable the button
  Uint8List? selectedImageBytes;

  Future<Uint8List> loadImageBytes(String imagePath) async {
    final ByteData data = await DefaultAssetBundle.of(context).load(imagePath);
    return data.buffer.asUint8List();
  }

  Future<void> makePredictionRequest() async {
    final imageBytes = await loadImageBytes(imagePathController.text);

    final fileContent = base64Encode(imageBytes);

    final url = Uri.parse(
        "https://detect.roboflow.com/trash-detection-hdig9/2?api_key=jdlaFUkLe3MhR4k5EW0s&name=YOUR_IMAGE.jpg");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'image': fileContent},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        predictionResult = jsonResponse.toString();
      });
    } else {
      setState(() {
        predictionResult = 'Failed to make a prediction request.';
      });
    }
  }

  // Define the _validateInput method to enable/disable the "Make Prediction" button
  void _validateInput() {
    final imageSelected = selectedImageBytes != null;
    setState(() {
      isPredictionButtonDisabled = !imageSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roboflow Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  // Load the selected image and display it
                  final selectedBytes = await pickedFile.readAsBytes();
                  setState(() {
                    selectedImageBytes = selectedBytes;
                  });

                  // Set the selected image path in the TextField (optional)
                  imagePathController.text = pickedFile.path;
                } else {
                  // Handle when the user cancels image selection
                }
                // Validate input whenever the button is pressed
                _validateInput();
              },
              child: const Text('Select Image from Gallery'),
            ),
            // Display the selected image (if available)
            if (selectedImageBytes != null)
              Image.memory(
                selectedImageBytes!,
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
            TextField(
              controller: imagePathController,
              decoration: const InputDecoration(labelText: 'Image Path'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  isPredictionButtonDisabled ? null : makePredictionRequest,
              child: const Text('Make Prediction'),
            ),
            const SizedBox(height: 20),
            const Text('Prediction Result:'),
            Text(predictionResult),
          ],
        ),
      ),
    );
  }
}
