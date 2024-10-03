import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      if (_newPasswordController.text == _confirmPasswordController.text) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_password', _newPasswordController.text);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password reset successfully!')),
        );

        Navigator.pop(context); // Go back to the login screen
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/Frame.png",
                    width: 23,
                    height: 23,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 23),
                ),
                const SizedBox(
                  height: 11,
                ),
                const Text(
                  "No warries, we’ll send you reset instructions.",
                  style: TextStyle(color: Color(0xff727272)),
                ),
                SizedBox(height: 1.h),
                const Text(
                  "New Password",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    hintText: 'password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: !_passwordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 1.h),
                const Text(
                  "Confirm New Password",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible1
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible1 = !_passwordVisible1;
                        });
                      },
                    ),
                    hintText: 'password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: !_passwordVisible1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                Center(
                  child: GestureDetector(
                    onTap: _resetPassword,
                    child: Container(
                      height: 60,
                      width: 370,
                      decoration: BoxDecoration(
                          color: const Color(0xffA47842),
                          borderRadius: BorderRadius.circular(13)),
                      child: const Center(
                        child: Text("Reset",
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
      ),
    );
  }
}
