import 'package:flutter/material.dart';
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

  Future<void> _resetPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final storedPassword = prefs.getString('password');

    if (_oldPasswordController.text == storedPassword) {
      if (_newPasswordController.text == _confirmPasswordController.text) {
        await prefs.setString('password', _newPasswordController.text);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password reset successfully')));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('New password and confirm password do not match')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Old password is incorrect')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text("Old Password", style: TextStyle(color: Color(0xff909090))),
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
        const Text("New Password", style: TextStyle(color: Color(0xff909090))),
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
    );
  }
}
