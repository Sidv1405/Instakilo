import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  FocusNode emailF = FocusNode();
  final password = TextEditingController();
  FocusNode passwordF = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 96.w,
            height: 100.h,
          ),
          Center(
            child: Image.asset('images/logo.jpg'),
          ),
          SizedBox(height: 120.h),
          textInput(email, Icons.email, "Email", emailF),
          SizedBox(height: 15.h),
          textInput(password, Icons.lock, "Password", passwordF),
          SizedBox(height: 10.h),
          forgotPassword(),
          SizedBox(height: 10.h),
          logIn(),
          SizedBox(height: 10.h),
          Padding(
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
                  Text(
                    " Sign Up",
                    style: TextStyle(fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Padding logIn() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          "Log In",
          style: TextStyle(fontSize: 23.sp, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget forgotPassword() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          "Forgot your password?",
          style: TextStyle(fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      );

  Widget textInput(TextEditingController controller, IconData icon, String hint, FocusNode focusNode) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: TextField(
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(icon, color: focusNode.hasFocus ? Colors.black : Colors.grey),
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: const Color(0xFF767676), width: 2.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: Colors.black, width: 2.w),
              )),
        ),
      );
}
