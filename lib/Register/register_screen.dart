import 'package:diamond_app/Register/tab_bar_screen.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
                  if (_formKey.currentState!.validate()) {
                    await _signUp();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabBarScreen(),
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sign-Up Successful')),
                    );
                  }
                  // Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  width: 370,
                  decoration: BoxDecoration(
                      color: const Color(0xffA47842),
                      borderRadius: BorderRadius.circular(13)),
                  child: const Center(
                    child: Text("Sign Up",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffFFFFFF))),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<void> _signUp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _usernameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('mobile', _phoneController.text);
    await prefs.setString('password', _passwordController.text);
  }
}
