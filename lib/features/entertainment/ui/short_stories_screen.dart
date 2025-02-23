import 'package:care_nest/features/entertainment/logic/get_all_stories_cubit/get_all_stories_cubit.dart';
import 'package:care_nest/features/entertainment/ui/widgets/short_stories_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShortStoriesScreen extends StatefulWidget {
  const ShortStoriesScreen({super.key});

  @override
  _ShortStoriesScreenState createState() => _ShortStoriesScreenState();
}

class _ShortStoriesScreenState extends State<ShortStoriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllStoriesCubit>().getAllStories();
  }

  @override
  Widget build(BuildContext context) {
    return const ShortStoriesScreenBody();
  }
}
