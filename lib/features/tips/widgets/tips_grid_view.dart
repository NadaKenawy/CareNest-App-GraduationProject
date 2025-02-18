import 'package:care_nest/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:go_router/go_router.dart';

class TipsGridView extends StatelessWidget {
  const TipsGridView({
    super.key,
    required this.articles,
  });

  final List<Map<String, String>> articles;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: .85, // Adjust aspect ratio for better fit
          ),
          itemCount: articles.length,
          itemBuilder: (context, index) {
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
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        articles[index]["image"]!,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 16.w),
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        articles[index]["title"]!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeightHelper.semiBold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
