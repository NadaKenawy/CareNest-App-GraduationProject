// import 'package:care_nest/core/theme/text_styless.dart';
// import 'package:care_nest/features/tips/ui/widgets/tips_grid_view.dart';
// import 'package:flutter/material.dart';

// class MomTipsScreenBody extends StatefulWidget {
//   const MomTipsScreenBody({super.key});

//   @override
//   _MomTipsScreenBodyState createState() => _MomTipsScreenBodyState();
// }

// class _MomTipsScreenBodyState extends State<MomTipsScreenBody> {
//   int selectedMonthIndex = 0;

//   final List<String> months =
//       List.generate(12, (index) => 'Month ${index + 1}');

//   final List<Map<String, String>> articles = [
//     {
//       "image": "assets/images/1530.webp",
//       "title": "Overcoming Postpartum Depression"
//     },
//     {
//       "image": "assets/images/17634.webp",
//       "title": "Caring for you, Caring for your kids"
//     },
//     {
//       "image": "assets/images/1530.webp",
//       "title": "Smoother Breastfeeding Experience"
//     },
//     {
//       "image": "assets/images/17634.webp",
//       "title": "Building a Support Network"
//     },
//     {"image": "assets/images/1530.webp", "title": "Embrace Your New Role"},
//     {"image": "assets/images/17634.webp", "title": "Mindfulness in Motherhood"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Mom Tips',
//           style: TextStyles.font20BlackSemiBold,
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 16),
//           TipsGridView(articles: articles),
//           const SizedBox(height: 16),
//         ],
//       ),
//     );
//   }
// }
