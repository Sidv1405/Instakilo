import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'signup_phone_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final email = TextEditingController();
  FocusNode emailF = FocusNode();
  final password = TextEditingController();
  FocusNode passwordF = FocusNode();
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 96.w,
              height: 210.h,
            ),
            Image.asset(
              'images/logo.jpg',
              width: 200.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 28.h),
            textInput(email, "Phone number, username or email", emailF, false),
            SizedBox(height: 10.h),
            textInput(password, "Password", passwordF, true),
            SizedBox(height: 10.h),
            forgotPassword(),
            SizedBox(height: 27.h),
            logIn(),
            SizedBox(height: 20.h),
            orUI(),
            SizedBox(height: 35.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.facebook_sharp, color: Colors.blue),
                    Text(
                      " Log in with Facebook ",
                      style: TextStyle(fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 180.h),
            signUp(),
          ],
        ),
      ),
    );
  }

  Padding orUI() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'OR',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget signUp() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 13.sp),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPhoneScreen()),
                );
              },
              child: Text(
                " Sign Up",
                style: TextStyle(fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding logIn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 47,
        decoration: BoxDecoration(
          color: const Color(0xFF0081FD),
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Text(
          "Log In",
          style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget forgotPassword() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          "Forgot password?",
          style: TextStyle(fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      );

  Widget textInput(TextEditingController controller, String hint, FocusNode focusNode, bool isPassword) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextField(
        style: TextStyle(fontSize: 16.sp, color: Colors.black),
        controller: controller,
        focusNode: focusNode,
        obscureText: isPassword ? showPass : false,
        decoration: InputDecoration(
          fillColor: const Color(0xFFF8F8F8),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    showPass ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                )
              : controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          controller.clear();
                        });
                      },
                    )
                  : null,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(color: const Color(0xFF767676), width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(color: const Color(0xFF767676), width: 1.w),
          ),
        ),
        onChanged: (text) {
          setState(() {}); // Để đảm bảo rằng giao diện sẽ cập nhật khi văn bản thay đổi
        },
      ),
    );
  }
}
