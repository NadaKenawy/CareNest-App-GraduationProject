import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/features/tips/data/models/get_all_tips_of_mom_response.dart';
import 'package:care_nest/features/tips/logic/get_all_tips_of_mom_cubit/get_all_tips_of_mom_cubit.dart';
import 'package:care_nest/features/tips/logic/get_all_tips_of_mom_cubit/get_all_tips_of_mom_state.dart';
import 'package:care_nest/features/tips/ui/widgets/mom_tips_skeleton.dart';
import 'package:care_nest/features/tips/ui/widgets/tips_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MomTipsScreenBody extends StatefulWidget {
  const MomTipsScreenBody({super.key});

  @override
  _MomTipsScreenBodyState createState() => _MomTipsScreenBodyState();
}

class _MomTipsScreenBodyState extends State<MomTipsScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllTipsOfMomCubit>().getAllTipsOfMom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mom Tips',
          style: TextStyles.font20BlackSemiMedium,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(
            child: BlocBuilder<GetAllTipsOfMomCubit, GetAllTipsOfMomState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () => const MomTipsSkeleton(),
                  success: (tipsList) {
                    return TipsGridView<MomTipData>(
                      tips: tipsList ?? [],
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
