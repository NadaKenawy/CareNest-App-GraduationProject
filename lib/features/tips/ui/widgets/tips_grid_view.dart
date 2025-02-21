import 'package:care_nest/core/routing/app_router.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TipsGridView<T> extends StatelessWidget {
  const TipsGridView({
    super.key,
    required this.tips,
    required this.imageExtractor,
    required this.categoryExtractor,
    required this.idExtractor,
  });

  final List<T> tips;
  final String Function(T tip) imageExtractor;
  final String? Function(T tip) categoryExtractor;
  final String Function(T tip) idExtractor;

  @override
  Widget build(BuildContext context) {
    if (tips.isEmpty) {
      return const Center(child: Text("No tips available"));
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          childAspectRatio: .75,
        ),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          final imageUrl = imageExtractor(tip);
          final categoryText = categoryExtractor(tip) ?? "";
          return InkWell(
            onTap: () {
              final tipId = idExtractor(tip);
              GoRouter.of(context)
                  .push(AppRouter.kTipDetailsScreen, extra: tipId);
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
                  imageUrl.isNotEmpty
                      ? ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.network(
                            imageUrl,
                            width: 200.w,
                            height: 182.h,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          width: 200.w,
                          height: 182.h,
                          color: Colors.grey,
                          child: const Icon(Icons.image, color: Colors.white),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      categoryText,
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
