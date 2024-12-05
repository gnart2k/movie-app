import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final bool isSuccess; // true for success, false for failure
  final VoidCallback onClose;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.isSuccess,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              size: 60,
              color: isSuccess ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onClose,
              style: ElevatedButton.styleFrom(
                backgroundColor: isSuccess ? Colors.green : Colors.red,
              ),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context, bool isSuccess) {
  showDialog(
    context: context,
    builder: (context) => CustomDialog(
      title: isSuccess ? 'Success' : 'Failed',
      message: isSuccess
          ? 'Your operation was successful!'
          : 'There was an error. Please try again.',
      isSuccess: isSuccess,
      onClose: () {
        Navigator.of(context).pop();
      },
    ),
  );
}