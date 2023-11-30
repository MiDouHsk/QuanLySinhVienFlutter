import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlysinhvien/ui/AppConstant.dart';
import 'package:quanlysinhvien/ui/page_register.dart';
import '../providers/loginviewmodel.dart';
import '../services/api_service.dart';
import 'customcontroller.dart';
import 'page_main.dart';

class PageLogin extends StatelessWidget {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  bool passToggle = true;
  static String routename = '/login';

  PageLogin({super.key});

  Future login(BuildContext context) async {
    String username = _userController.text.trim();
    String password = _passController.text.trim();
    ApiService api = ApiService();
    Response? response = await api.loginUser(username, password);
    if (response?.statusCode == 200) {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageMain(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    final size = MediaQuery.of(context).size;

    if (viewmodel.status == 3) {
      Future.delayed(Duration.zero, () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageMain(),
            ));
      });
    }
    return Scaffold(
      backgroundColor: AppConstant.backgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text("Home_Page",style: TextStyle(),),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLogo(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Wellcom back you've been missed!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //user
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Username",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: "",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _passController,
                      obscureText: passToggle,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_open),
                        // suffixIcon: InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       passToggle = !passToggle;
                        //     });
                        //   },
                        //   child: Icon(passToggle
                        //       ? Icons.visibility
                        //       : Icons.visibility_off),
                        // ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot password',
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  viewmodel.status == 2
                      ? Text(
                          viewmodel.errorMessage,
                          style: AppConstant.textError,
                        )
                      : Text(""),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        String username = _userController.text.trim();
                        String password = _passController.text.trim();
                        viewmodel.login(username, password);
                      },
                      child: const MyButton(
                        textButton: "Sign In",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "not a member ",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .popAndPushNamed(PageRegister.routename),
                        child: Text(
                          " Register now!",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // loading
            viewmodel.status == 1 ? CustomSpinner(size: size) : Container(),
          ],
        ),
      ),
    );
  }
}
