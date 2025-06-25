import 'package:flutter/material.dart';

class DidItWork extends StatelessWidget {
  const DidItWork({super.key});

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
                isSuccess ? 'Great to Hear! 🎉' : 'We’re Listening!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isSuccess
                    ? 'We’re so happy to hear that our help made a difference for your baby.\nThank you for trusting us! 😊'
                    : 'Your feedback matters. We’ll keep improving to better support you and your baby’s needs. 🤝',
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Did it work?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _showFeedbackDialog(context, true),
          child: const Icon(Icons.check_circle, color: Colors.green, size: 28),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => _showFeedbackDialog(context, false),
          child: const Icon(Icons.cancel, color: Colors.red, size: 28),
        ),
      ],
    );
  }
}
