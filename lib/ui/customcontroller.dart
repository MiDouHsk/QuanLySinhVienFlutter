import 'package:flutter/material.dart';

Image CustomLogo() {
  return Image.asset(
    "assets/image/user.png",
    height: 150,
    width: 150,
  );
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.textButton});
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          textButton,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.lock,
      size: 100,
      color: Colors.black,
    );
  }
}

class CustomSpinner extends StatelessWidget {
  const CustomSpinner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.grey.shade800.withOpacity(.5),
      child: const Center(
        child: Image(
          width: 150,
          image: AssetImage(
            "assets/image/Spinner.gif",
          ),
        ),
      ),
    );
  }
}
