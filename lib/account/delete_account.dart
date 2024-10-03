import 'package:diamond_app/Register/tab_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtReason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text("User Name", style: TextStyle(color: Color(0xff909090))),
        const SizedBox(height: 6),
        TextField(
          controller: txtUserName,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xffBBBBBB))),
            hintText: "Enter User Name",
            hintStyle: const TextStyle(color: Color(0xff909090)),
            prefixIcon:
                const Icon(Icons.person_4_outlined, color: Color(0xff909090)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        const SizedBox(height: 13),
        const Text("Account Delete Reason",
            style: TextStyle(color: Color(0xff909090))),
        const SizedBox(height: 6),
        SizedBox(
          height: 120,
          width: 400,
          child: TextField(
            maxLines: null,
            expands: true,
            controller: txtReason,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB))),
              hintText: "Enter Text",
              hintStyle: const TextStyle(color: Color(0xff909090)),
              prefixIcon:
                  const Icon(Icons.edit_square, color: Color(0xff909090)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffBBBBBB)),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: GestureDetector(
            onTap: _deleteAccount,
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

  Future<void> _deleteAccount() async {
    String userName = txtUserName.text;
    String deleteReason = txtUserName.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (userName.isNotEmpty && deleteReason.isNotEmpty) {
      await prefs.remove('userName');
      await prefs.remove('password');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account deleted successfully')),
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TabBarScreen(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }
}
