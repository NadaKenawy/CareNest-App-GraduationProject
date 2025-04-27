import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../logic/create_message/create_message_cubit.dart';
import '../logic/get_community_messages/get_community_messages_cubit.dart';
import '../data/repos/create_message_repo.dart';
import 'widgets/community_screen_body.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CreateMessageCubit(
          GetIt.instance<CreateMessageRepo>(),
          context.read<GetCommunityMessagesCubit>(),
        ),
        child: const CommunityScreenBody(),
      ),
    );
  }
}
