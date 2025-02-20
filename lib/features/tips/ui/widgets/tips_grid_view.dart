import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/tips/data/models/get_all_tips_of_baby_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TipsGridView extends StatelessWidget {
  const TipsGridView({
    super.key,
    required this.tips,
  });

  final List<BabyTipData> tips;

  @override
  Widget build(BuildContext context) {
    if (tips.isEmpty) {
      return const Center(child: Text("No tips available"));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 16,
          childAspectRatio: .82,
        ),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kTipDetailsScreen);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.grey, width: 2),
              ),
              elevation: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  tip.image != null && tip.image!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.network(
                            tip.image!,
                            width: 200.w,
                            height: 160.h,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          width: 200.w,
                          height: 132.h,
                          color: Colors.grey,
                          child: const Icon(Icons.image, color: Colors.white),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      tip.category ?? "",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
