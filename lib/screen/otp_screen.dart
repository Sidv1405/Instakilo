import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'log_in_screen.dart';

class OtpScreen extends StatefulWidget {
  final String inputData;

  const OtpScreen({super.key, required this.inputData});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpCode = TextEditingController();
  FocusNode otpCodeF = FocusNode();

  @override
  void initState() {
    super.initState();
  }

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
                "To confirm your account, enter the 6-digit code that we sent to ${widget.inputData}",
                19.5),
            SizedBox(height: 16.h),
            textInput(otpCode, "Confirmation code", otpCodeF),
            SizedBox(height: 16.h),
            nextStep(),
            SizedBox(height: 16.h),
            resendCode(),
            SizedBox(height: 380.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    child: Text("Already have an account?",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF0081FD),
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogInScreen()),
                      );
                    },
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

  Padding resendCode() {
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
        child: TextButton(
          child:
              Text("I Didn't Receive the Code", style: TextStyle(fontSize: 18.sp, color: Colors.black)),
          onPressed: () {
            Navigator.pop(context);
          },
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
        "Enter the confirmation code",
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
