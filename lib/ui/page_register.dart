import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlysinhvien/model/profile.dart';
import 'package:quanlysinhvien/providers/registerviewmodel.dart';
import 'package:quanlysinhvien/ui/AppConstant.dart';
import 'package:quanlysinhvien/ui/page_login.dart';

import 'customcontroller.dart';
import 'page_main.dart';

class PageRegister extends StatelessWidget {
  static String routename = '/register';
  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _CpassController = TextEditingController();
  bool agree = true;

  PageRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<RegisterViewModel>(context);
    final profile = Profile();
    final size = MediaQuery.of(context).size;
    if (profile.token != " ") {
      Future.delayed(
        Duration.zero,
        () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageMain(),
              ));
        },
      );
    }

    return Scaffold(
      backgroundColor: AppConstant.backgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () =>
              Navigator.of(context).popAndPushNamed(PageLogin.routename),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        // title: viewmodel.status == 2
        //     ? Text(
        //         viewmodel.errorMessage,
        //         style: TextStyle(color: Colors.white),
        //       )
        //     : Text(""),
        // centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: viewmodel.status == 3 || viewmodel.status == 4
              ? Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/image/bronya_stick.gif'),
                    ),
                    Text(
                      "Đăng ký thành công!",
                      style: AppConstant.font_roboto,
                    ),
                    viewmodel.status == 3
                        ? Text(
                            " bạn cần xác nhận email để hoàng thành đăng kí!")
                        : Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.popAndPushNamed(
                              context, PageLogin.routename),
                          child: Text(
                            "Bấm vào đây",
                            style: AppConstant.textlink,
                          ),
                        ),
                        Text(" để đăng nhập"),
                      ],
                    )
                  ],
                )
              : Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        CustomLogo(),
                        Text(
                          'Resgiter Now',
                          style: AppConstant.font_roboto2,
                        ),
                        Text(
                          'To Open Your World',
                          style: AppConstant.font_roboto,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
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
                              labelText: "Email",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                              hintText: "",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
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
                              prefixIcon: Icon(Icons.man_4),
                              hintText: "",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _passController,
                            obscureText: false,
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
                              prefixIcon: Icon(Icons.key_off_outlined),
                              hintText: "",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _CpassController,
                            obscureText: false,
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
                              labelText: "Re_password",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.key_off_outlined),
                              hintText: "",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          viewmodel.errormessage,
                          style: AppConstant.textError,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: viewmodel.agree,
                              onChanged: (value) {
                                viewmodel.setAgree(value!);
                              },
                            ),
                            const Text(
                              "Agree ",
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      "rule",
                                      style: AppConstant.textlink,
                                    ),
                                    content: SingleChildScrollView(
                                      child: Text(viewmodel.quydinh),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                " Rules",
                                style: AppConstant.textbody,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: GestureDetector(
                            onTap: () {
                              final email = _emailController.text.trim();
                              final username = _userController.text.trim();
                              final pass = _passController.text.trim();
                              final cpass = _passController.text.trim();

                              viewmodel.register(email, username, pass, cpass);
                            },
                            child: const MyButton(
                              textButton: "Resgister",
                            ),
                          ),
                        ),
                      ],
                    ),
                    viewmodel.status == 1
                        ? CustomSpinner(size: size)
                        : Container(),
                  ],
                ),
        ),
      )),
    );
  }
}
