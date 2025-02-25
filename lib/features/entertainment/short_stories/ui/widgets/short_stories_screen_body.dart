// ignore_for_file: deprecated_member_use

import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/features/entertainment/short_stories/data/models/get_all_stories_response.dart';
import 'package:care_nest/features/entertainment/short_stories/logic/get_all_stories_cubit.dart';
import 'package:care_nest/features/entertainment/short_stories/logic/get_all_stories_state.dart';
import 'package:care_nest/features/entertainment/short_stories/ui/widgets/short_stories_grid_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:care_nest/core/routing/app_router.dart';

class ShortStoriesScreenBody extends StatelessWidget {
  const ShortStoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Short Stories',
                    style: TextStyles.font20BlackSemiBold,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.w, right: 16.w, bottom: 16.h, top: 8.h),
                  child: BlocBuilder<GetAllStoriesCubit, GetAllStoriesState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox.shrink(),
                        loading: () =>
                            const Center(child: ShortStoriesGridSkeleton()),
                        success: (stories) {
                          if (stories!.isEmpty) {
                            return const Center(
                              child: Text('No stories available'),
                            );
                          }
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.w,
                              mainAxisSpacing: 12.h,
                            ),
                            itemCount: stories.length,
                            itemBuilder: (context, index) {
                              final StoryData story = stories[index];
                              return InkWell(
                                onTap: () {
                                  GoRouter.of(context).push(
                                    AppRouter.kStoryDetailsScreen,
                                    extra: story,
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Stack(
                                      children: [
                                        story.image != null
                                            ? Image.network(
                                                story.image!,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                        'assets/images/The Sleepy Little Kitten.jpeg',
                                                        fit: BoxFit.cover),
                                              )
                                            : Image.asset(
                                                'assets/images/The Sleepy Little Kitten.jpeg',
                                                fit: BoxFit.cover,
                                              ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12.w,
                                                  vertical: 4.h),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                ),
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  story.title ?? '',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeightHelper
                                                        .semiBold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        error: (apiError) =>
                            Center(child: Text(apiError.message ?? 'Error')),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
