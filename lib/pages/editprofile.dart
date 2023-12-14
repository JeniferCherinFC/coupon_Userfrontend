// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_frontend/pages/profilesetting.dart';

import '../constants/colors.dart';


class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  File? _selectedImage;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  bool _isname = true;
  bool _isemail = true;
  bool _isphonenumber = true;
  bool _islocation = true;
  bool _isaddress = true;
  bool _iscity = true;
  bool _isstate = true;
  bool _iscountry = true;
  bool _ispincode = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.west_outlined),
                      color: Colors.black87,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileSetting()),
                        );
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Edit',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' Profile',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: greens,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 56),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: _selectedImage != null
                              ? FileImage(_selectedImage!)
                              : null,
                          backgroundColor: greens,
                        ),
                        Positioned(
                          bottom: -11,
                          left: 75,
                          child: IconButton(
                            onPressed: () {
                              _showImagePickerOption();
                            },
                            icon: const Icon(Icons.camera_alt),
                            iconSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _nameController,
                    readOnly: _isname,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greens, // Border color when not focused
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit),
                        color: greens,
                        onPressed: () {
                          setState(() {
                            _isname = !_isname;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _emailController,
                    readOnly: _isemail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greens, // Border color when not focused
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit),
                        color: greens,
                        onPressed: () {
                          setState(() {
                            _isemail = !_isemail;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _phoneNumberController,
                    readOnly: _isphonenumber,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greens, // Border color when not focused
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit),
                        color: greens,
                        onPressed: () {
                          setState(() {
                            _isphonenumber = !_isphonenumber;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _locationController,
                    readOnly: _islocation,
                    decoration: InputDecoration(
                      hintText: 'Location',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greens, // Border color when not focused
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit),
                        color: greens,
                        onPressed: () {
                          setState(() {
                            _islocation = !_islocation;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 5, // when user presses enter it will adapt to it
                    controller: _addressController,
                    readOnly: _isaddress,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greens, // Border color when not focused
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit),
                        color: greens,
                        onPressed: () {
                          setState(() {
                            _isaddress = !_isaddress;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _cityController,
                    readOnly: _iscity,
                    decoration: InputDecoration(
                      hintText: 'City',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greens, // Border color when not focused
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit),
                        color: greens,
                        onPressed: () {
                          setState(() {
                            _iscity = !_iscity;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _stateController,
                    readOnly: _isstate,
                    decoration: InputDecoration(
                      hintText: 'State',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greens, // Border color when not focused
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit),
                        color: greens,
                        onPressed: () {
                          setState(() {
                            _isstate = !_isstate;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _countryController,
                    readOnly: _iscountry,
                    decoration: InputDecoration(
                      hintText: 'Country',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greens, // Border color when not focused
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit),
                        color: greens,
                        onPressed: () {
                          setState(() {
                            _iscountry = !_iscountry;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _pincodeController,
                    readOnly: _ispincode,
                    decoration: InputDecoration(
                      hintText: 'Pin code',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greens, // Border color when not focused
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(43, 135, 97, 1),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit),
                        color: greens,
                        onPressed: () {
                          setState(() {
                            _ispincode = !_ispincode;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: greens,
                      minimumSize: const Size(140, 40),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Save ',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showImagePickerOption() async {
    await showModalBottomSheet(
      backgroundColor: greens,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.gallery);
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.black,
                          ),
                          Text("Gallery")
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.camera);
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.black,
                          ),
                          Text("Camera")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedImage = await picker.pickImage(
      source: source,
    );

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }
}
