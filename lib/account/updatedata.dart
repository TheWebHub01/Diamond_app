
import 'package:diamond_app/account/change_password.dart';
import 'package:diamond_app/account/delete_account.dart';
import 'package:diamond_app/account/my_account.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/Frame.png",
                      height: 25,
                      width: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 115,
                  ),
                  const Text(
                    "My Account",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  dividerHeight: 0,
                  padding: const EdgeInsets.all(8),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelPadding: const EdgeInsets.only(left: 5),
                  dividerColor: Colors.white,
                  unselectedLabelColor: const Color(0xff828282),
                  labelColor: const Color(0xff000000),
                  indicatorColor: const Color(0xffA47842),
                  tabs: const [
                    Center(
                        child: Text(
                      "My\nAccount",
                      textAlign: TextAlign.center,
                    )),
                    Center(
                        child: Text("Change\nPassword",
                            textAlign: TextAlign.center)),
                    Center(
                        child: Text("delete\naccount",
                            textAlign: TextAlign.center)),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    MyAccount(),
                    ChangePassword(),
                    DeleteAccount(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
