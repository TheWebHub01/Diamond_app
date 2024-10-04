import 'package:diamond_app/Register/tab_bar_screen.dart';
import 'package:diamond_app/progress_loader/progress_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Keep this if you need Firestore
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      txtUserName.text = prefs.getString('name') ?? '';
      txtEmail.text = prefs.getString('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    ProgressLoader pl = ProgressLoader(context, isDismissible: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text("User Name", style: TextStyle(color: Color(0xff909090))),
        const SizedBox(height: 6),
        deleteaccountWidget(txtUserName.text),
        SizedBox(
          height: 15,
        ),
        deleteaccountWidget(txtEmail.text),
        // TextField(
        //   controller: txtEmail,
        //   decoration: InputDecoration(
        //     focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(15),
        //       borderSide: const BorderSide(color: Color(0xffBBBBBB)),
        //     ),
        //     hintText: "User Email",
        //     hintStyle: const TextStyle(color: Color(0xff909090)),
        //     prefixIcon:
        //         const Icon(Icons.person_4_outlined, color: Color(0xff909090)),
        //     border: OutlineInputBorder(
        //       borderSide: const BorderSide(color: Color(0xffBBBBBB)),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 13),
        // TextField(
        //   controller: txtUserName,
        //   decoration: InputDecoration(
        //     focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(15),
        //       borderSide: const BorderSide(color: Color(0xffBBBBBB)),
        //     ),
        //     hintText: "User Name",
        //     hintStyle: const TextStyle(color: Color(0xff909090)),
        //     prefixIcon:
        //         const Icon(Icons.person_4_outlined, color: Color(0xff909090)),
        //     border: OutlineInputBorder(
        //       borderSide: const BorderSide(color: Color(0xffBBBBBB)),
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 13),
        // const Text("Account Delete Reason",
        //     style: TextStyle(color: Color(0xff909090))),
        const SizedBox(height: 30),
        Center(
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Delete",
                          style: const TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Are you sure you want to delete account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffE1E1E1)),
                                child: const Center(
                                  child: Text("No"),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await pl.show();
                                await _deleteAccount();
                                await pl.hide();
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffA47842),
                                ),
                                child: const Center(
                                    child: Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
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
                    style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF))),
              ),
            ),
          ),
           SizedBox(height: 30),
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
       ))))] );
  }

  Container deleteaccountWidget(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffBBBBBB))),
      child: Row(
        children: [
          Icon(
            Icons.person_4_outlined,
            color: Color(0xff909090),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(color: Color(0xff909090), fontSize: 17),
          )
        ],
      ),
    );
  }

  Future<void> _deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // User is not logged in
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No user is currently logged in.')),
      );
      return;
    }

    try {
      // Remove user data from Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .delete();

      // Delete the account
      await user.delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account deleted successfully')),
      );

      // Navigate to the tab bar screen after account deletion
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TabBarScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete account: ${e.message}')),
      );
      print("=== delete account ===>${e.message}");
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $error')),
      );
    }
  }
}
