import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fypscreensdemo/constants/routes.dart';

import 'package:image_picker/image_picker.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController datetimeController = TextEditingController();
  final TextEditingController additionalinfoController =
      TextEditingController();

  File? _selectedImage;
  String selectedSize = '';
  String selectedType = '';
  bool caraccess = false;
  bool cave = false;
  bool underwater = false;
  bool notforgeneralcleanup = false;

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(AppRoutes.profileview);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                'Enter Information of Litter Dump spotted',
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
              const SizedBox(height: 40 * fem),
              const Text(
                'What is the size of the Litter Dump?',
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: Color.fromARGB(255, 13, 60, 94),
                ),
              ),
              RadioListTile(
                title: const Text(
                  'Fits in a Bag',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Fits in a Bag',
                groupValue: selectedSize,
                onChanged: (value) {
                  setState(() {
                    selectedSize = value as String;
                  });
                },
                secondary: const Icon(Icons.shopping_bag),
                activeColor: const Color(0xffffffff),
              ),
              RadioListTile(
                title: const Text(
                  'Fits in a Wheelbarrow',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Fits in a Wheelbarrow',
                groupValue: selectedSize,
                onChanged: (value) {
                  setState(() {
                    selectedSize = value as String;
                  });
                },
                secondary: const Icon(Icons.production_quantity_limits),
                activeColor: const Color(0xffffffff),
              ),
              RadioListTile(
                title: const Text(
                  'Truck Needed',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Truck Needed',
                groupValue: selectedSize,
                onChanged: (value) {
                  setState(() {
                    selectedSize = value as String;
                  });
                },
                secondary: const Icon(Icons.local_shipping),
                activeColor: const Color(0xffffffff),
              ),
              const SizedBox(height: 20 * fem),
              Text(
                'Selected Size: $selectedSize',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40 * fem),
              const Text(
                'What is the Type of the Litter Dump?',
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: Color.fromARGB(255, 13, 60, 94),
                ),
              ),
              RadioListTile(
                title: const Text(
                  'Household',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Household',
                groupValue: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value as String;
                  });
                },
                secondary: const Icon(Icons.other_houses),
                activeColor: const Color(0xffffffff),
              ),
              RadioListTile(
                title: const Text(
                  'Construction',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Construction',
                groupValue: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value as String;
                  });
                },
                secondary: const Icon(Icons.construction),
                activeColor: const Color(0xffffffff),
              ),
              RadioListTile(
                title: const Text(
                  'Plastic',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Plastic',
                groupValue: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value as String;
                  });
                },
                secondary: const Icon(Icons.workspaces_outline),
                activeColor: const Color(0xffffffff),
              ),
              RadioListTile(
                title: const Text(
                  'Organic',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Organic',
                groupValue: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value as String;
                  });
                },
                secondary: const Icon(Icons.compost),
                activeColor: const Color(0xffffffff),
              ),
              RadioListTile(
                title: const Text(
                  'Dangerous',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Dangerous',
                groupValue: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value as String;
                  });
                },
                secondary: const Icon(Icons.report_gmailerrorred),
                activeColor: const Color(0xffffffff),
              ),
              RadioListTile(
                title: const Text(
                  'Animal carcass',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Animal carcass',
                groupValue: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value as String;
                  });
                },
                secondary: const Icon(Icons.pets),
                activeColor: const Color(0xffffffff),
              ),
              RadioListTile(
                title: const Text(
                  'Glass',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Glass',
                groupValue: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value as String;
                  });
                },
                secondary: const Icon(Icons.workspaces_outline),
                activeColor: const Color(0xffffffff),
              ),
              RadioListTile(
                title: const Text(
                  'Other/Mix',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: 'Other/Mix',
                groupValue: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value as String;
                  });
                },
                secondary: const Icon(Icons.priority_high),
                activeColor: const Color(0xffffffff),
              ),
              const SizedBox(height: 20 * fem),
              Text(
                'Selected Type: $selectedType',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40 * fem),
              const Text(
                'Litter Dump Accessibility',
                textAlign: TextAlign.left, // Align left
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: Color.fromARGB(255, 13, 60, 94),
                ),
              ),
              const SizedBox(height: 20 * fem),
              CheckboxListTile(
                title: const Text(
                  'Accessable by car',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: caraccess,
                onChanged: (bool? value) {
                  setState(() {
                    caraccess = value!;
                  });
                },
                secondary: const Icon(Icons.directions_car),
              ),
              CheckboxListTile(
                title: const Text(
                  'Located on height',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: cave,
                onChanged: (bool? value) {
                  setState(() {
                    cave = value!;
                  });
                },
                secondary: const Icon(Icons.terrain),
              ),
              CheckboxListTile(
                title: const Text(
                  'Underwater/ on the water side',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: underwater,
                onChanged: (bool? value) {
                  setState(() {
                    underwater = value!;
                  });
                },
                secondary: const Icon(Icons.water),
              ),
              CheckboxListTile(
                title: const Text(
                  'Illegal landfilling',
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xffffffff),
                  ),
                ),
                value: notforgeneralcleanup,
                onChanged: (bool? value) {
                  setState(() {
                    notforgeneralcleanup = value!;
                  });
                },
                secondary: const Icon(Icons.warning),
              ),
              const SizedBox(height: 40 * fem),
              const Text(
                'Additional Information',
                textAlign: TextAlign.left, // Align left
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  color: Color.fromARGB(255, 13, 60, 94),
                ),
              ),
              const SizedBox(height: 20 * fem),
              TextField(
                controller: additionalinfoController,

                maxLines: null, // Set to null for a multi-line text area
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Additional Information here...',
                ),
              ),
              const SizedBox(height: 40 * fem),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.reportmap);
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
      ),
    );
  }
}
