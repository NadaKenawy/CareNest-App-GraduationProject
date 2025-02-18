import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MomTipsScreenBody extends StatefulWidget {
  const MomTipsScreenBody({super.key});

  @override
  _MomTipsScreenBodyState createState() => _MomTipsScreenBodyState();
}

class _MomTipsScreenBodyState extends State<MomTipsScreenBody> {
  int selectedMonthIndex = 0;

  final List<String> months =
      List.generate(12, (index) => 'Month ${index + 1}');

  final List<Map<String, String>> articles = [
    {
      "image": "assets/images/mother-with-cute-newborn (1).webp",
      "title": "Overcoming Postpartum Depression"
    },
    {
      "image": "assets/images/mother-with-cute-newborn (1).webp",
      "title": "Caring for you, Caring for your kids"
    },
    {
      "image": "assets/images/mother-with-cute-newborn (1).webp",
      "title": "Smoother Breastfeeding Experience"
    },
    {
      "image": "assets/images/mother-with-cute-newborn (1).webp",
      "title": "Building a Support Network"
    },
    {
      "image": "assets/images/mother-with-cute-newborn (1).webp",
      "title": "Embrace Your New Role"
    },
    {
      "image": "assets/images/mother-with-cute-newborn (1).webp",
      "title": "Mindfulness in Motherhood"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mom Tips',
          style: TextStyles.font20BlackSemiBold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Expanded(
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
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Colors.grey, width: 1),
                      ),
                      color: Colors.white,
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
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
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
