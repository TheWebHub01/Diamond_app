import 'package:diamond_app/Home/home_screen.dart';
import 'package:diamond_app/Register/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:diamond_app/utiles/auth_service.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('saved_email') ?? '';
      _passwordController.text = prefs.getString('saved_password') ?? '';
      _rememberMe = prefs.getBool('remember_me') ?? false;
    });
  }

  bool _isChecked = false;

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
                "E-mail",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 1.h),
              TextFormField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Enter your E-mail',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your E-mail';
                  }
                  final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 1.h),
              TextFormField(
                controller: _passwordController,
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
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                ),
                obscureText: !_passwordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    child: Row(
                      children: [
                        CustomCheckbox(isChecked: _isChecked),
                        SizedBox(width: 2.w),
                        const Text('Remember me',
                            style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ));
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      )),
                ],
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      bool isLoggedIn = await _signIn();
                      if (isLoggedIn) {
                        if (_rememberMe) {
                          await _saveCredentials();
                        } else {
                          await _clearSavedCredentials();
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                email: _emailController.text,
                              ),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid credentials')),
                        );
                      }
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 330,
                    decoration: BoxDecoration(
                      color: const Color(0xffA47842),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Center(
                      child: Text("Login",
                          style: TextStyle(
                              fontSize: 20, color: Color(0xffFFFFFF))),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 80, child: Divider()),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "or login with",
                      style: TextStyle(color: Color(0xffACACAC)),
                    ),
                  ),
                  SizedBox(width: 80, child: Divider()),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => AuthService().signInWithGoogle(),
                      child:
                          Image.asset("assets/images/google.png", width: 40)),
                  const SizedBox(width: 15),
                  GestureDetector(
                      onTap: () => AuthService().signInWithFacebook(),
                      child: Image.asset("assets/images/facebook.png",
                          height: 40)),
                  const SizedBox(width: 15),
                  GestureDetector(
                      onTap: () => AuthService().signInWithApple(),
                      child:
                          Image.asset("assets/images/apple.png", height: 40)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _signIn() async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email');
    final storedPassword = prefs.getString('password');

    return _emailController.text == storedEmail &&
        _passwordController.text == storedPassword;
  }

  Future<void> _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_email', _emailController.text);
    await prefs.setString('saved_password', _passwordController.text);
    await prefs.setBool('remember_me', _rememberMe);
  }

  Future<void> _clearSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_email');
    await prefs.remove('saved_password');
    await prefs.remove('remember_me');
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;

  const CustomCheckbox({super.key, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isChecked ? const Color(0xffA47842) : Colors.transparent,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: isChecked ? const Color(0xffA47842) : Colors.grey,
          width: 2.0,
        ),
      ),
      child: isChecked
          ? const Icon(
              Icons.check,
              size: 16.0,
              color: Colors.white,
            )
          : null,
    );
  }
}
