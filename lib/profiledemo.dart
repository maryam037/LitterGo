import 'package:flutter/material.dart';
import 'package:fypscreensdemo/profilesavedemo.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {super.key,
      required String fullName,
      required String address,
      required String phoneNumber,
      File? profileImage});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  File? _selectedImage;
  final _formKey = GlobalKey<FormState>(); // Form key for validation

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
      backgroundColor: const Color(0xffe8eff1),
      appBar: AppBar(
        backgroundColor: const Color(0xffe8eff1),
        foregroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20 * fem),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20 * fem),
          ),
          child: Form(
            key: _formKey, // Assign the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Make User Profile!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: Color(0xff1473b9),
                  ),
                ),
                GestureDetector(
                  onTap: _selectImage,
                  child: Container(
                    margin: const EdgeInsets.all(20 * fem),
                    width: 150 * fem,
                    height: 150 * fem,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff4daddf),
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
                buildTextFieldWithImage(
                  'assets/user.png',
                  'Full Name',
                  fem,
                  ffem,
                  context,
                  fullnameController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Full Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20 * fem),
                buildTextFieldWithImage(
                  'assets/datetime.png',
                  'Address',
                  fem,
                  ffem,
                  context,
                  addressController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20 * fem),
                buildTextFieldWithImage(
                  'assets/phone.png',
                  'Phone Number',
                  fem,
                  ffem,
                  context,
                  phonenumberController,
                  (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Phone Number';
                    } else if (value.length != 11) {
                      return 'Phone Number must have 11 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40 * fem),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid, navigate to ProfileDisplayPage
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileDisplayPage(
                            fullName: fullnameController.text,
                            address: addressController.text,
                            phoneNumber: phonenumberController.text,
                            profileImage: _selectedImage,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10 * fem),
                    decoration: BoxDecoration(
                      color: const Color(0xff4daddf),
                      borderRadius: BorderRadius.circular(20 * fem),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0, 4 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10 * fem),
                        Image.asset(
                          'assets/rightarrow.png',
                          width: 6 * fem,
                          height: 12 * fem,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextFieldWithImage(
  String imagePath,
  String labelText,
  double fem,
  double ffem,
  BuildContext context,
  TextEditingController controller,
  String? Function(String?)? validator, // Validator function
  {
  bool obscureText = false,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        imagePath,
        width: 23.33 * fem,
        height: 15.33 * fem,
      ),
      SizedBox(width: 10 * fem),
      Expanded(
        child: TextFormField(
          // Use TextFormField for validation
          controller: controller,
          validator: validator, // Assign the validator function
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Color(0xff4daddf),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff4daddf)),
            ),
          ),
          style: TextStyle(
            fontSize: 18 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2,
            color: const Color(0xff4daddf),
          ),
          obscureText: obscureText,
        ),
      ),
    ],
  );
}
