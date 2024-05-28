import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/styles.dart';
import 'widgets/doc_logo_and_name.dart';
import 'widgets/doctor_image_and_text.dart';
import 'widgets/get_started_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DocLogoAndName(),
                    SizedBox(height: 30.h),
                    const DoctorImageAndText(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        children: [
                          Text(
                            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                            style: TextStyles.font13GreyRegular,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30.h),
                          const GetStartedButton(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
