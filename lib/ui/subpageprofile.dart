import 'package:flutter/material.dart';
import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SubPageProfile extends StatelessWidget {
  const SubPageProfile({super.key});
  static int idpage = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MainViewModel().closeMenu(),
      child: Container(
        color: AppConstant.backgroundcolor,
        child: Center(
          child: Text("Profile"),
        ),
      ),
    );
  }
}
