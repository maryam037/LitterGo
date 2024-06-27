import 'package:flutter/material.dart';
import 'package:fypscreensdemo/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../services/errorsnackbar.dart';

class ImageProcessingWidget extends StatefulWidget {
  const ImageProcessingWidget({Key? key}) : super(key: key);
  @override
  _ImageProcessingWidgetState createState() => _ImageProcessingWidgetState();
}

class _ImageProcessingWidgetState extends State<ImageProcessingWidget> {
  File? _selectedImage;
  String response = '';
  bool _isImageSelected = false;
  double? confidence;

  Future<void> showLitterDetectedDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Litterdump Detected!'),
          content: const Text(
              'A cleaning team will be dispatched to litterdump location'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showLitterNotDetectedDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Litter Not Detected!'),
          content:
              const Text('Please take photo of litterdump from another angle'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> processImage() async {
    const apiKey = 'jdlaFUkLe3MhR4k5EW0s'; // Replace with your API Key
    const modelEndpoint =
        'trash-detection-hdig9/2'; // Replace with your model endpoint

    final ImagePicker picker = ImagePicker();
    final XFile? imageFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (imageFile == null) {
      return; // User canceled the image picker
    }

    try {
      final File file = File(imageFile.path);
      final bytes = file.readAsBytesSync();
      final image = base64Encode(bytes);

      final apiUrl =
          Uri.https('detect.roboflow.com', modelEndpoint, {'api_key': apiKey});

      final http.Response apiResponse = await http.post(
        apiUrl,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: image,
      );

      if (apiResponse.statusCode == 200) {
        final decodedResponse = utf8.decode(apiResponse.bodyBytes);
        setState(() {
          response = decodedResponse;
          var temp = jsonDecode(apiResponse.body) as Map<String, dynamic>;
          confidence = ((temp['predictions'])[0])[
              'confidence']; // Assign confidence value

          print(confidence);
        });
      } else {
        print('API request failed: ${apiResponse.reasonPhrase}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _selectImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        _isImageSelected =
            true; // Set the flag to true when an image is selected
        processImage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        title: const Text('Detecting Litterdump'),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'LITTER DETECTION',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xff1473b9),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Upload image of spotted litter dump for detection.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff1473b9),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: _selectImage,
                      child: Center(
                        child: _isImageSelected
                            ? ClipRRect(
                                child: Image.file(
                                  _selectedImage!,
                                  width: 400,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo,
                                    size: 50.0,
                                    color: Color(0xff1473b9),
                                  ),
                                  Text(
                                    'Upload Photo',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2,
                                      color: Color(0xff1473b9),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (_isImageSelected) // Show response only if the image is selected
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Server Response:',
                              style: TextStyle(
                                fontSize: 28,
                                color: Color(0xff1473b9),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              response,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xff1473b9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        if (!_isImageSelected) {
                          showErrorSnackbar(
                              context, 'Please upload a photo first.');
                        } else if (response.isEmpty) {
                          showErrorSnackbar(
                              context, 'Waiting for server response...');
                        } else {
                          if (confidence != null && confidence! > 0.4) {
                            showLitterDetectedDialog(context).then((_) {
                              
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.tracking);
                            });
                          } else {
                            showLitterNotDetectedDialog(context).then((_) {
                           
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.imagedetect);
                            });
                          }
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _isImageSelected && response.isNotEmpty
                              ? const Color(0xff1473b9)
                              : const Color(0xff999999),
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
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward,
                              size: 24,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]))),
    );
  }
}
