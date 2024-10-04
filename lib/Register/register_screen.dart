import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diamond_app/Register/tab_bar_screen.dart';
import 'package:diamond_app/progress_loader/progress_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _passwordVisible = false;
  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Sign up with Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim());

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': _usernameController.text.trim(),
          'phone': _phoneController.text.trim(),
          'email': _emailController.text.trim(),
          'address': _addressController.text.trim(),
        });

        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TabBarScreen()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-Up Successful')),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';
        if (e.code == 'email-already-in-use') {
          errorMessage = 'The email is already in use.';
        } else if (e.code == 'weak-password') {
          errorMessage = 'The password is too weak.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email is invalid.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      } catch (e) {
        print('Error: $e'); // Print the actual error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An unexpected error occurred.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "First Name",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 1.h),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.person_4_outlined,
                  color: Colors.grey,
                ),
                hintText: 'Enter Name',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                if (value.length < 3) {
                  return 'Username must be at least 3 characters long';
                }
                return null;
              },
            ),
            SizedBox(height: 1.h),
            const Text(
              "Mobile Number",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: 'Enter number',
                prefixIcon: Icon(
                  Icons.call_outlined,
                  color: Colors.grey,
                ),
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter number';
                }
                final phoneRegExp = RegExp(r'^\+?[0-9]{10,12}$');
                if (!phoneRegExp.hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 1.h),
            const Text(
              "E-mail",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 1.h),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  )),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
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
            SizedBox(height: 1.h),
            const Text(
              "Address",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 1.h),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: _addressController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                ),
                hintText: 'Enter Address',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }

                return null;
              },
            ),
            SizedBox(height: 1.h),
            const Text(
              "Password",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 1.h),
            TextFormField(
              textInputAction: TextInputAction.done,
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                hintText: 'Enter password',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_passwordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Center(
                child: GestureDetector(
              onTap: () async {
                await pl.show();
                await _signUp();
                await pl.hide();
              },
              child: Container(
                height: 60,
                width: 370,
                decoration: BoxDecoration(
                    color: const Color(0xffA47842),
                    borderRadius: BorderRadius.circular(13)),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }
}
