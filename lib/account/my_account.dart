import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final _nameController = TextEditingController();
  final _firstController = TextEditingController();
  final _lastController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController(text: "Surat");
  final _mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
    _splitName();
  }

  void _splitName() {
    String fullName = "The WebHub";
    List<String> parts = fullName.split(' ');
    _firstController.text = parts.isNotEmpty ? parts[0] : '';
    _lastController.text = parts.length > 1 ? parts.sublist(1).join(' ') : '';
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

  Future<void> _updateProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('mobile', _mobileController.text);

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Profile Updated')));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text("First Name", style: TextStyle(color: Color(0xff909090))),
          const SizedBox(height: 6),
          TextField(
            controller: _firstController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB))),
              hintText: "Enter First Name",
              hintStyle: const TextStyle(color: Color(0xff909090)),
              prefixIcon:
                  const Icon(Icons.person_4_outlined, color: Color(0xff909090)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text("Last Name", style: TextStyle(color: Color(0xff909090))),
          const SizedBox(height: 6),
          TextField(
            controller: _lastController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB))),
              hintText: "Enter Last Name",
              hintStyle: const TextStyle(color: Color(0xff909090)),
              prefixIcon:
                  const Icon(Icons.person_4_outlined, color: Color(0xff909090)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 13),
          const Text("E-mail", style: TextStyle(color: Color(0xff909090))),
          const SizedBox(height: 6),
          TextField(
            controller: _emailController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB))),
              hintText: "Enter your E-mail",
              hintStyle: const TextStyle(color: Color(0xff909090)),
              prefixIcon:
                  const Icon(Icons.email_outlined, color: Color(0xff909090)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 13),
          const Text("Address", style: TextStyle(color: Color(0xff909090))),
          const SizedBox(height: 6),
          TextField(
            controller: _addressController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB))),
              hintText: "Enter your Address",
              hintStyle: const TextStyle(color: Color(0xff909090)),
              prefixIcon:
                  const Icon(Icons.person_4_outlined, color: Color(0xff909090)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 13),
          const Text("Mobile Number",
              style: TextStyle(color: Color(0xff909090))),
          const SizedBox(height: 6),
          TextField(
            controller: _mobileController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffBBBBBB))),
              hintText: "Enter Mobile Number",
              hintStyle: const TextStyle(color: Color(0xff909090)),
              prefixIcon: const Icon(Icons.call, color: Color(0xff909090)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: _updateProfile,
              child: Container(
                height: 60,
                width: 390,
                decoration: BoxDecoration(
                    color: const Color(0xffA47842),
                    borderRadius: BorderRadius.circular(13)),
                child: const Center(
                  child: Text("Update",
                      style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
