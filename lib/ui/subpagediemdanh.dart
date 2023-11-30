import 'package:flutter/material.dart';
import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SubPageDiemdanh extends StatelessWidget {
  const SubPageDiemdanh({super.key});
  static int idpage = 3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MainViewModel().closeMenu(),
      child: Container(
        color: AppConstant.backgroundcolor,
        child: Center(
          child: Text("DiemDanh"),
        ),
      ),
    );
  }
}
