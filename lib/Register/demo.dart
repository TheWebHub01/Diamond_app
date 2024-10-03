// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _auth = FirebaseAuth.instance;
//   final _formKey = GlobalKey<FormState>();

//   String username = '';
//   String email = '';
//   String mobile = '';
//   String address = '';
//   String password = '';

//   void _signUp() async {
//     if (_formKey.currentState!.validate()) {
//       // try {
//       // Create a new user with email and password
//       final UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       // Save additional user details in Firestore
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set({
//         'username': username,
//         'email': email,
//         'mobile': mobile,
//         'address': address,
//       });

//       // Navigate to home or success screen
//       // Navigator.pushReplacementNamed(context, '/home');
//       // } catch (e) {
//       //   print('Error: $e');
//       //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       //     content: Text('Sign-up failed. Please try again.'),
//       //   ));
//       // }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Up')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Username'),
//                 onChanged: (value) {
//                   setState(() {
//                     username = value;
//                   });
//                 },
//                 validator: (value) =>
//                     value!.isEmpty ? 'Enter a username' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 onChanged: (value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//                 validator: (value) => value!.isEmpty || !value.contains('@')
//                     ? 'Enter a valid email'
//                     : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Mobile'),
//                 keyboardType: TextInputType.phone,
//                 onChanged: (value) {
//                   setState(() {
//                     mobile = value;
//                   });
//                 },
//                 validator: (value) =>
//                     value!.isEmpty ? 'Enter a mobile number' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Address'),
//                 onChanged: (value) {
//                   setState(() {
//                     address = value;
//                   });
//                 },
//                 validator: (value) =>
//                     value!.isEmpty ? 'Enter an address' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 onChanged: (value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//                 validator: (value) => value!.isEmpty || value.length < 6
//                     ? 'Enter a valid password'
//                     : null,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _signUp,
//                 child: Text('Sign Up'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
