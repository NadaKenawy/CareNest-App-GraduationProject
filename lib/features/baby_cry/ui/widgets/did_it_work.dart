import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/user_satisfaction_cubit/user_satisfaction_cubit.dart';
import '../../logic/user_satisfaction_cubit/user_satisfaction_state.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/constants.dart';

class DidItWork extends StatefulWidget {
  final String? cryId;
  const DidItWork({super.key, this.cryId});

  @override
  State<DidItWork> createState() => _DidItWorkState();
}

class _DidItWorkState extends State<DidItWork> {
  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final t = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    setState(() {
      token = t;
    });
  }

  void _showFeedbackDialog(BuildContext context, bool isSuccess) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isSuccess ? 'Great to Hear! 🎉' : 'We\'re Listening!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isSuccess
                    ? 'We\'re so happy to hear that our help made a difference for your baby.\nThank you for trusting us! 😊'
                    : 'Your feedback matters. We\'ll keep improving to better support you and your baby\'s needs. 🤝',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSuccess ? Colors.green : Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text("OK",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendFeedback(BuildContext context, String value) {
    if (token == null || widget.cryId == null) return;
    context.read<UserSatisfactionCubit>().setUserSatisfaction(
          cryId: widget.cryId!,
          userSatisfaction: value,
          token: token!,
        );
  }

  @override
  Widget build(BuildContext context) {
    if (token == null || widget.cryId == null) return const SizedBox.shrink();
    return BlocConsumer<UserSatisfactionCubit, UserSatisfactionState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          },
          success: (response) {
            Navigator.of(context, rootNavigator: true).pop();
            _showFeedbackDialog(
                context, response.data.userSatisfaction == 'Good');
          },
          error: (message) {
            Navigator.of(context, rootNavigator: true).pop();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Error'),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Did it work?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => _sendFeedback(context, "Good"),
              child:
                  const Icon(Icons.check_circle, color: Colors.green, size: 28),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => _sendFeedback(context, "Bad"),
              child: const Icon(Icons.cancel, color: Colors.red, size: 28),
            ),
          ],
        );
      },
    );
  }
}
