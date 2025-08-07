import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final Duration duration;
  final TextStyle? textStyle;
  final VoidCallback? onFinish;

  const CountdownTimer({
    Key? key,
    required this.duration,
    this.textStyle,
    this.onFinish,
  }) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration remaining;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remaining = widget.duration;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remaining.inSeconds == 0) {
        widget.onFinish?.call();
        timer?.cancel();
      } else {
        setState(() {
          remaining -= const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String format(Duration d) {
    final hours = d.inHours.toString().padLeft(2, '0');
    final minutes = (d.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      format(remaining),
      style: widget.textStyle ?? Theme.of(context).textTheme.titleLarge,
    );
  }
}
