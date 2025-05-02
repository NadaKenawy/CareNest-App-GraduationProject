import 'package:care_nest/features/community/data/models/get_online_users/get_online_users_response.dart';
import 'package:care_nest/features/community/logic/get_online_users/get_online_users_cubit.dart';
import 'package:care_nest/features/community/ui/widgets/commuinty_members_list_skel.dart';
import 'package:care_nest/features/community/ui/widgets/community_members_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/get_online_users/get_online_users_state.dart';

class CommintyOnlineUsersBlocBuilder extends StatelessWidget {
  const CommintyOnlineUsersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOnlineUsersCubit, GetOnlineUsersState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          success: (getAllOnlineUsers) {
            var usersList = List<User>.from(getAllOnlineUsers).toList();

            return setupSuccess(usersList);
          },
          error: (error) {
            return setupError();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    // return const DoctorsListSkeletonizer();
    return const CommuintyMembersListSkel();
  }

  Widget setupSuccess(List<User> usersList) {
    return CommunityMembersList(
      usersList: usersList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
