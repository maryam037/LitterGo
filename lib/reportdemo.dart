import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fypscreensdemo/mapsdemo.dart';
import 'package:image_picker/image_picker.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController datetimeController = TextEditingController();
  File? _selectedImage;

  Future<void> _selectImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const double fem = 1.0;
    const double ffem = 1.0;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Submit a Report'),
        backgroundColor: const Color(0xff1473b9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20 * fem),
        child: Column(
          children: [
            const SizedBox(height: 20 * fem),
            const Text(
              'REPORT NOW',
              style: TextStyle(
                fontSize: 28 * fem,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10 * fem),
            const Text(
              'Report a litter dump near you',
              style: TextStyle(
                fontSize: 18 * fem,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20 * fem),
            GestureDetector(
              onTap: _selectImage,
              child: Container(
                margin: const EdgeInsets.all(20 * fem),
                width: 150 * fem,
                height: 150 * fem,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff1473b9),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                child: Center(
                  child: _selectedImage != null
                      ? ClipOval(
                          child: Image.file(
                            _selectedImage!,
                            width: 150 * fem,
                            height: 150 * fem,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 50 * fem,
                              color: Color(0xffffffff),
                            ),
                            Text(
                              'Upload Photo',
                              style: TextStyle(
                                fontSize: 14 * ffem,
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
                  const SizedBox(height: 20 * fem),
                  buildTextFieldWithImage(
                    'assets/pin.png',
                    'LITTER DUMP LOCATION',
                    context,
                    locationController,
                  ),
                  const SizedBox(height: 20 * fem),
                  buildTextFieldWithImage(
                    'assets/datetime.png',
                    'DATE AND TIME',
                    context,
                    datetimeController,
                  ),
                  const SizedBox(height: 40 * fem),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationMapPage(
                            location: locationController.text,
                            dateTime: datetimeController.text,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10 * fem),
                      decoration: BoxDecoration(
                        color: const Color(0xff1473b9),
                        borderRadius: BorderRadius.circular(20 * fem),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0 * fem, 4.0 * ffem),
                            blurRadius: 2 * fem,
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2 * fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                          SizedBox(width: 10 * fem),
                          Icon(
                            Icons.arrow_forward,
                            size: 24 * fem,
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
        width: 24,
        height: 16.0,
      ),
      const SizedBox(width: 10.0),
      Expanded(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Color(0xffffffff),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffffffff),
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
