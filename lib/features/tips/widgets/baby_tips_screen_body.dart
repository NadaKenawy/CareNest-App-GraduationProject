import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/tips/widgets/tips_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyTipsScreenBody extends StatefulWidget {
  const BabyTipsScreenBody({super.key});

  @override
  _BabyTipsScreenBodyState createState() => _BabyTipsScreenBodyState();
}

class _BabyTipsScreenBodyState extends State<BabyTipsScreenBody> {
  int selectedMonthIndex = 0;

  final List<String> months =
      List.generate(12, (index) => 'Month ${index + 1}');

  final List<Map<String, String>> articles = [
    {
      "image": "assets/images/mother-with-cute-newborn.webp",
      "title": "Celebrating Milestones"
    },
    {
      "image": "assets/images/mother-with-cute-newborn.webp",
      "title": "Smooth Transition"
    },
    {
      "image": "assets/images/mother-with-cute-newborn.webp",
      "title": "Boosting Communication"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Baby Tips',
          style: TextStyles.font20BlackSemiBold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          SizedBox(
            height: 48.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: months.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedMonthIndex = index;
                      });
                    },
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          color: selectedMonthIndex == index
                              ? ColorsManager.secondryBlueColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              width: 2,
                              color: ColorsManager.secondryBlueColor)),
                      child: Center(
                        child: Text(
                          months[index],
                          style: TextStyle(
                            color: selectedMonthIndex == index
                                ? Colors.white
                                : Colors.black.withOpacity(.6),
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          TipsGridView(articles: articles),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
