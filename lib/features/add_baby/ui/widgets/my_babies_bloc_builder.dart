import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_cubit.dart';
import 'package:care_nest/features/add_baby/logic/get_all_babies_cubit/get_all_babies_state.dart';
import 'package:care_nest/features/add_baby/ui/widgets/my_babies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBabiesBlocBuilder extends StatelessWidget {
  const MyBabiesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllBabiesCubit, GetAllBabiesState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () {
              return setupLoading();
            },
            success: (babiesData) {
              var babiesList = babiesData;

              return setupSuccess(
                babiesList,
              );
            },
            error: (error) {
              return setupError();
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }

  Widget setupLoading() {
    // return const Expanded(
    //   child: Column(
    //       // children: [
    //       //   const SpecialityShimmerLoading(),
    //       //   verticalSpace(8),
    //       //   const DoctorsShimmerLoading(),
    //       //  ],
    //       ),
    // );
    return const CircularProgressIndicator();
  }

  Widget setupSuccess(babiesList) {
    return MyBabiesListView(
      babiesList: babiesList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
