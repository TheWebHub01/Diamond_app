import 'package:diamond_app/progress_loader/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController(text: "Surat");
  final _mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _addressController.text = prefs.getString('address') ?? '';
      _mobileController.text = prefs.getString('mobile') ?? '';
    });
  }

  final _formKey = GlobalKey<FormState>();

  Future<void> _updateProfile() async {
    final prefs = await SharedPreferences.getInstance();

    // Store updated details in SharedPreferences
    await prefs.setString('name', _nameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('mobile', _mobileController.text);

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      try {
        // Step 1: Update email in Firebase Authentication
        await user.updateEmail(_emailController.text);
        await user.reload(); // Reload user data after updating the email
        user = FirebaseAuth.instance.currentUser; // Re-fetch the user

        // Step 2: Update email in Cloud Firestore
        await users.doc(user!.uid).update({
          'name': _nameController.text,
          'email': _emailController.text,
          'address': _addressController.text,
          'mobile': _mobileController.text,
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile Updated successfully...')),
        );
      } on FirebaseAuthException catch (e) {
        // Handle Firebase Auth errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update email: ${e.message}')),
        );
        print("error ==>${e.message}");
      } catch (error) {
        // Handle other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _buildTextField(
                "First Name",
                _nameController,
                Icons.person_4_outlined,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  if (value.length < 3) {
                    return 'Username must be at least 3 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 13),
              _buildTextField(
                "E-mail",
                _emailController,
                Icons.email_outlined,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 13),
              _buildTextField(
                "Address",
                _addressController,
                Icons.home_outlined,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 13),
              _buildTextField("Mobile Number", _mobileController, Icons.call,
                  (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter number';
                }
                final phoneRegExp = RegExp(r'^\+?[0-9]{10,12}$');
                if (!phoneRegExp.hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              }, isMobile: true),
              const SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await pl.show();
                      await _updateProfile();
                      await pl.hide();
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 390,
                    decoration: BoxDecoration(
                      color: const Color(0xffA47842),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Center(
                      child: Text("Update",
                          style: TextStyle(
                              fontSize: 20, color: Color(0xffFFFFFF))),
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

  Widget _buildTextField(String label, TextEditingController controller,
      IconData icon, String? Function(String?)? validator,
      {bool isMobile = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xff909090))),
        const SizedBox(height: 6),
        TextFormField(
          validator: validator,
          controller: controller,
          textInputAction:
              isMobile ? TextInputAction.done : TextInputAction.next,
          keyboardType: isMobile ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xffBBBBBB)),
            ),
            hintText: "Enter $label",
            hintStyle: const TextStyle(color: Color(0xff909090)),
            prefixIcon: Icon(icon, color: const Color(0xff909090)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
