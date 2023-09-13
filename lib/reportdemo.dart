import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController datetimeController = TextEditingController();
  Uint8List? selectedImageBytes;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final selectedBytes = await pickedFile.readAsBytes();
      setState(() {
        selectedImageBytes = selectedBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Submit a Report'),
        backgroundColor: const Color(0xff1473b9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'REPORT NOW',
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Report a litter dump near you',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: const Color(0xff1473b9),
                  borderRadius: BorderRadius.circular(75.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4.0),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: selectedImageBytes != null
                    ? Image.memory(
                        selectedImageBytes!,
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 50.0,
                              color: Color(0xffffffff),
                            ),
                            Text(
                              'Upload Photo',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  buildTextFieldWithImage(
                    'assets/pin.png',
                    'LITTER DUMP LOCATION',
                    context,
                    locationController,
                  ),
                  const SizedBox(height: 20.0),
                  buildTextFieldWithImage(
                    'assets/datetime.png',
                    'DATE AND TIME',
                    context,
                    datetimeController,
                  ),
                  const SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      // Handle submission logic here
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff1473b9),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0, 4.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Color(0xffffffff),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            size: 24.0,
                            color: Color(0xffffffff),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextFieldWithImage(
  String imagePath,
  String labelText,
  BuildContext context,
  TextEditingController controller, {
  bool obscureText = false,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
        width: 24.0,
        height: 16.0,
      ),
      const SizedBox(width: 10.0),
      Expanded(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 163, 164, 164),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 163, 164, 164),
              ),
            ),
            hintStyle: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              height: 1.2,
              color: Color(0xff1473b9),
            ),
          ),
        ),
      ),
    ],
  );
}
