import 'package:flutter/material.dart';
import 'package:quanlysinhvien/repositories/register_repository.dart';

class RegisterViewModel with ChangeNotifier {
  int status = 0;
  // 0 chua dang ki, 1 dang ki, 2 dk loi, 3 dk can xac minh email, 4 dk ko xm email
  String errormessage = "";
  bool agree = false;
  final registerRepo = RegisterRepository();
  String quydinh = "Chấp Nhận các điều khoản sau:\n" +
      "1. các thông tin của bạn sẽ được chia sẽ với các thành viên khác.\n" +
      "2. các thông tin của bạn có thể ảnh hướng tới kết quả học tập\n" +
      "3. thông tin của bạn sẽ được xóa vĩnh viễn nếu có yêu cầu xóa từ Admin.\n";

  void setAgree(bool value) {
    agree = value;
    notifyListeners();
  }

  Future<void> register(
      String email, String username, String pass, String cpass) async {
    status = 1;
    notifyListeners();
    errormessage = " ";
    if (agree == false) {
      status = 2;
      errormessage += "bạn phải đồng ý với các điều khoản trước khi đăng ký!\n";
      return;
    }
    if (email.isEmpty || username.isEmpty || pass.isEmpty) {
      status = 2;
      errormessage += "Email, username, password không được phép để trống\n";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid == false) {
      status = 2;
      errormessage += "email không hợp lệ!\n";
    }

    if (pass.length < 8) {
      status = 2;
      errormessage += "Password phải nhiều hơn 8 ký tự\n";
    }
    if (pass != cpass) {
      status = 2;
      errormessage += "mật khẩu nhập lại không giống!\n";
    }
    status = await registerRepo.register(email, username, pass);

    // su dung repository goi ham login va lay ket qua
    notifyListeners();
  }
}
