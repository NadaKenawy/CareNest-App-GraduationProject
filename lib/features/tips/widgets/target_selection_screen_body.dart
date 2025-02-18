import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TargetSelectionScreenBody extends StatelessWidget {
  const TargetSelectionScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Select Category',
          style: TextStyles.font20BlackSemiBold,
        )),
        body: Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kMomTipsScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(1, 2),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                          'assets/images/mother-with-cute-newborn (1).webp'),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Mom Tips',
                        style: TextStyles.font20BlackSemiBold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBabyTipsScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(1, 2),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                          'assets/images/mother-with-cute-newborn.webp'),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Baby Tips',
                        style: TextStyles.font20BlackSemiBold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 56.h,
              ),
            ],
          )),
        ));
  }
}
