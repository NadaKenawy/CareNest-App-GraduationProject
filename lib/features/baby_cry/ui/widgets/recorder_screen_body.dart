// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:care_nest/core/theme/font_weight_helper.dart';
import 'package:care_nest/core/theme/text_styless.dart';
import 'package:care_nest/core/widgets/custom_button.dart';
import 'package:care_nest/features/baby_cry/ui/widgets/prediction_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:share_plus/share_plus.dart';

import '../../logic/cubit/prediction_cubit.dart';

class RecorderScreenBody extends StatefulWidget {
  const RecorderScreenBody({super.key});

  @override
  RecorderScreenBodyState createState() => RecorderScreenBodyState();
}

class RecorderScreenBodyState extends State<RecorderScreenBody>
    with SingleTickerProviderStateMixin {
  final AudioRecorder audioRecorder = AudioRecorder();
  bool isRecording = false;
  double scale = 1.0;
  Timer? timer;
  double progress = 0.0;
  String? filePath;

  @override
  void dispose() {
    audioRecorder.dispose();
    timer?.cancel();
    super.dispose();
  }

  // Start recording
  Future<void> startRecording() async {
    if (await audioRecorder.hasPermission()) {
      final directory = await getApplicationDocumentsDirectory();
      filePath = '${directory.path}/myRecording.wav';
      log("Recording saved at: $filePath");

      setState(() {
        isRecording = true;
        progress = 0.0;
      });

      await audioRecorder.start(const RecordConfig(encoder: AudioEncoder.wav),
          path: filePath!);

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          scale = scale == 1.0 ? 1.5 : 1.0;
          progress += 1 / 5;
        });
        if (progress >= 1.0) {
          stopRecording();
        }
      });
    }
  }

  // Stop recording
  Future<void> stopRecording() async {
    if (!isRecording) return;

    await audioRecorder.stop();
    timer?.cancel();

    setState(() {
      isRecording = false;
      scale = 1.0;
      progress = 0.0;
    });

    if (filePath != null) {
      context.read<PredictionCubit>().uploadAudio(File(filePath!));
    }
    // GoRouter.of(context).push(AppRouter.kAnalysisResultScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headerText(),
            SizedBox(height: 48.h),
            recordingCircle(),
            SizedBox(height: 28.h),
            isRecording ? recordingProgress() : const SizedBox(),
            SizedBox(height: 100.h),
            const PredictionBlocListener(),
          ],
        ),
      ),
    );
  }

  // Header text
  Widget headerText() {
    return const Text(
      "Ready to listen",
      style: TextStyle(fontSize: 28, fontWeight: FontWeightHelper.semiBold),
    );
  }

  // Animated circle for recording
  Widget recordingCircle() {
    return Stack(
      alignment: Alignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          AnimatedContainer(
            duration: Duration(milliseconds: 800 + (i * 200)),
            width: 120 + (i * 20) * scale,
            height: 120 + (i * 20) * scale,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: [
                ColorsManager.primaryPinkColor,
                ColorsManager.primaryPinkColor.withOpacity(0.6),
                ColorsManager.primaryPinkColor.withOpacity(0.2),
              ][i],
            ),
          ),
        GestureDetector(
          onTap: isRecording ? stopRecording : startRecording,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: 100 * scale,
            height: 100 * scale,
            child: const Icon(
              Icons.mic,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      ],
    );
  }

  // Progress indicator while recording
  Widget recordingProgress() {
    return Column(
      children: [
        const Text(
          "Recording...",
          style: TextStyle(color: ColorsManager.primaryPinkColor, fontSize: 16),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            color: ColorsManager.primaryPinkColor,
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
