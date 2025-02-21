import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/tips/data/models/get_tip_details_response.dart'; // تأكد من استيراد الموديل الصحيح
import 'package:care_nest/features/tips/logic/get_tip_details_cubit/get_tip_details_cubit.dart';
import 'package:care_nest/features/tips/logic/get_tip_details_cubit/get_tip_details_state.dart';
import 'package:care_nest/features/tips/ui/widgets/tip_details_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TipDetailsScreenBody extends StatefulWidget {
  const TipDetailsScreenBody({super.key});

  @override
  State<TipDetailsScreenBody> createState() => _TipDetailsScreenBodyState();
}

class _TipDetailsScreenBodyState extends State<TipDetailsScreenBody> {
  late String tipId;
  bool _isInitialized = false;

  String cleanText(String text) {
    return text.replaceAll(RegExp(r'\n\s*\n'), '\n').trim();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final extra = GoRouterState.of(context).extra;
      if (extra is String) {
        tipId = extra;
        context.read<GetTipDetailsCubit>().getTipDetails(tipId);
      }
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetTipDetailsCubit, GetTipDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const TipDetailsSkeleton(),
            error: (apiErrorModel) => Center(
              child: Text(
                'Error: ${apiErrorModel.message}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
            success: (tipDetails) {
              final headerWithEmoji =
                  cleanText(tipDetails.header).replaceAll("!", "! 😊");
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: tipDetails.image.isNotEmpty
                              ? Image.network(
                                  tipDetails.image,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/getimg_ai_img-hA6pbEpwT1cadtyJzT7U4.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          top: 56,
                          left: 16,
                          child: InkWell(
                            onTap: () => GoRouter.of(context).pop(),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.black45,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "${cleanText(tipDetails.category)} 💖",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeightHelper.semiBold,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Text(
                        headerWithEmoji,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: List.generate(
                          tipDetails.tip.length,
                          (index) =>
                              tipItemWidget(tipDetails.tip[index], index),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16.w, right: 16.w, top: 8.h, bottom: 20.h),
                      child: Text(
                        "${cleanText(tipDetails.advice)} 💖",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget tipItemWidget(TipItem item, int index) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1}. ${cleanText(item.title)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            cleanText(item.description),
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
