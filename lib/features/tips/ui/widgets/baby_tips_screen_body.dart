import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/tips/data/models/get_all_tips_of_baby_response.dart';
import 'package:care_nest/features/tips/logic/get_all_tips_of_baby_cubit/get_all_tips_of_baby_cubit.dart';
import 'package:care_nest/features/tips/logic/get_all_tips_of_baby_cubit/get_all_tips_of_baby_state.dart';
import 'package:care_nest/features/tips/ui/widgets/baby_tips_skeleton.dart';
import 'package:care_nest/features/tips/ui/widgets/tips_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<GetAllTipsOfBabyCubit>().getAllTipsOfBaby();
  }

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
          SizedBox(height: 16.h),
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
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 2,
                          color: ColorsManager.secondryBlueColor,
                        ),
                      ),
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
          SizedBox(height: 24.h),
          Expanded(
            child: BlocBuilder<GetAllTipsOfBabyCubit, GetAllTipsOfBabyState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () =>
                      const BabyTipsSkeleton(),
                  success: (tipsList) {
                    final filteredTips = tipsList
                            ?.where(
                                (tip) => tip.month == (selectedMonthIndex + 1))
                            .toList() ??
                        [];
                    return TipsGridView<BabyTipData>(
                      tips: filteredTips,
                      imageExtractor: (tip) => tip.image ?? '',
                      categoryExtractor: (tip) => tip.category,
                      idExtractor: (tip) => tip.id ?? '',
                    );
                  },
                  error: (apiErrorModel) => Center(
                    child: Text(
                      'Error: ${apiErrorModel.message}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
