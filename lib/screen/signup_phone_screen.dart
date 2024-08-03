import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPhoneScreen extends StatefulWidget {
  const SignUpPhoneScreen({super.key});

  @override
  State<SignUpPhoneScreen> createState() => _SignUpPhoneScreenState();
}

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
  final mobileNumber = TextEditingController();
  FocusNode mobileNumberF = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            arrowBack(),
            SizedBox(height: 2.h),
            title(),
            content(
                "Enter the mobile number on which you can be contacted. "
                "No one will see this on your profile.",
                19.5),
            SizedBox(height: 16.h),
            textInput(mobileNumber, "Mobile number", mobileNumberF),
            SizedBox(height: 5.h),
            content("You may receive SMS notification from us for security and login purposes", 16),
            SizedBox(height: 16.h),
            nextStep(),
            SizedBox(height: 16.h),
            signUpWithEmail(),
            SizedBox(height: 270.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 14.sp, color: const Color(0xFF0081FD), fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Padding nextStep() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF0081FD),
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Text(
          "Next",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
      ),
    );
  }

  Padding signUpWithEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(2.r),
          border: Border.all(color: const Color(0x80767676), width: 1.w),
        ),
        child: Text(
          "Sign up with email address",
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ),
      ),
    );
  }

  Widget textInput(
    TextEditingController controller,
    String hint,
    FocusNode focusNode,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextField(
        style: TextStyle(fontSize: 16.sp, color: Colors.black),
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          fillColor: const Color(0xFFF8F8F8),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 18.sp, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(color: const Color(0x80767676), width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: BorderSide(color: const Color(0x80767676), width: 1.w),
          ),
        ),
      ),
    );
  }

  Padding arrowBack() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Padding title() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: const Text(
        "What's your mobile number?",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
      ),
    );
  }

  Padding content(String content, double size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(
        content,
        style: TextStyle(fontSize: size, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
