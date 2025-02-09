import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTextTimerWidget extends StatefulWidget {
  final int initialSeconds;
  final TextStyle? textStyle;

  const CountdownTextTimerWidget({
    super.key,
    required this.initialSeconds,
    this.textStyle,
  });

  @override
  State<CountdownTextTimerWidget> createState() =>
      _CountdownTextTimerWidgetState();
}

class _CountdownTextTimerWidgetState extends State<CountdownTextTimerWidget> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel(); // Stop the timer when countdown is finished
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(_remainingSeconds),
      style: widget.textStyle ??
          const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
