import 'package:flutter/material.dart';
import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SubPageTimkiem extends StatelessWidget {
  const SubPageTimkiem({super.key});
  static int idpage = 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MainViewModel().closeMenu(),
      child: Container(
        color: AppConstant.backgroundcolor,
        child: Center(
          child: Text("Timkiem"),
        ),
      ),
    );
  }
}
