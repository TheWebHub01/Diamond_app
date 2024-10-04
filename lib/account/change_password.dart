import 'package:diamond_app/progress_loader/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;
  bool passwordVisible3 = false;
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // User is not logged in
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No user is currently logged in.')),
      );
      return;
    }

    try {
      // Reauthenticate the user with the old password
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: _oldPasswordController.text,
      );

      await user.reauthenticateWithCredential(credential);

      // Check if new password and confirm password match
      if (_newPasswordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('New password and confirm password do not match.')),
        );
        return;
      }

      // Update password
      await user.updatePassword(_newPasswordController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password changed successfully.')),
      );

      // Optionally, clear the fields after successful password change
      _oldPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to change password: ${e.message}')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $error')),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text("Old Password",
              style: TextStyle(color: Color(0xff909090))),
          const SizedBox(height: 6),
          TextField(
            controller: _oldPasswordController,
            obscureText: !passwordVisible1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB))),
              hintText: "Enter Old Password",
              hintStyle: const TextStyle(color: Color(0xff909090)),
              prefixIcon:
                  const Icon(Icons.lock_outline, color: Color(0xff909090)),
              suffixIcon: IconButton(
                icon: Icon(
                    passwordVisible1 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff909090)),
                onPressed: () {
                  setState(
                    () {
                      passwordVisible1 = !passwordVisible1;
                    },
                  );
                },
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          const Text("New Password",
              style: TextStyle(color: Color(0xff909090))),
          const SizedBox(height: 6),
          TextField(
            controller: _newPasswordController,
            obscureText: !passwordVisible2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB))),
              hintText: "Enter New Password",
              hintStyle: const TextStyle(color: Color(0xff909090)),
              prefixIcon:
                  const Icon(Icons.lock_outline, color: Color(0xff909090)),
              suffixIcon: IconButton(
                icon: Icon(
                    passwordVisible2 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff909090)),
                onPressed: () {
                  setState(
                    () {
                      passwordVisible2 = !passwordVisible2;
                    },
                  );
                },
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          const Text("Confirm New Password",
              style: TextStyle(color: Color(0xff909090))),
          const SizedBox(height: 6),
          TextField(
            controller: _confirmPasswordController,
            obscureText: !passwordVisible3,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB))),
              hintText: "Enter Confirm Password",
              hintStyle: const TextStyle(color: Color(0xff909090)),
              prefixIcon:
                  const Icon(Icons.lock_outline, color: Color(0xff909090)),
              suffixIcon: IconButton(
                icon: Icon(
                    passwordVisible3 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff909090)),
                onPressed: () {
                  setState(
                    () {
                      passwordVisible3 = !passwordVisible3;
                    },
                  );
                },
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: _resetPassword,
              child: Container(
                height: 60,
                width: 390,
                decoration: BoxDecoration(
                    color: const Color(0xffA47842),
                    borderRadius: BorderRadius.circular(13)),
                child: const Center(
                  child: Text("Done",
                      style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF))),
                ),
              ),
            ),
          ),
        ],
=======
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text("Old Password",
                style: TextStyle(color: Color(0xff909090))),
            const SizedBox(height: 6),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
              controller: _oldPasswordController,
              obscureText: !passwordVisible1,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                ),
                hintText: "Enter Old Password",
                hintStyle: const TextStyle(color: Color(0xff909090)),
                prefixIcon:
                    const Icon(Icons.lock_outline, color: Color(0xff909090)),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible1 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff909090),
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible1 = !passwordVisible1;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 13),
            const Text("New Password",
                style: TextStyle(color: Color(0xff909090))),
            const SizedBox(height: 6),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
              controller: _newPasswordController,
              obscureText: !passwordVisible2,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                ),
                hintText: "Enter New Password",
                hintStyle: const TextStyle(color: Color(0xff909090)),
                prefixIcon:
                    const Icon(Icons.lock_outline, color: Color(0xff909090)),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible2 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff909090),
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible2 = !passwordVisible2;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 13),
            const Text("Confirm New Password",
                style: TextStyle(color: Color(0xff909090))),
            const SizedBox(height: 6),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                if (value != _newPasswordController.text) {
                  return 'Passwords do not match. Please enter the same password';
                }
                return null;
              },
              controller: _confirmPasswordController,
              obscureText: !passwordVisible3,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                ),
                hintText: "Enter Confirm Password",
                hintStyle: const TextStyle(color: Color(0xff909090)),
                prefixIcon:
                    const Icon(Icons.lock_outline, color: Color(0xff909090)),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible3 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff909090),
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible3 = !passwordVisible3;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    await pl.show();
                    await _changePassword();
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
                    child: Text("Done",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffFFFFFF))),
                  ),
                ),
              ),
            ),
          ],
        ),
>>>>>>> 4f1f1556c83e6336d188e9bd3d81a5bbc3fc3c7d
      ),
    );
  }
}
