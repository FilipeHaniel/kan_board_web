import 'dart:async';

import 'package:flutter/material.dart';

class StudyPage extends StatefulWidget {
  final String taskTitle;

  const StudyPage({
    super.key,
    required this.taskTitle,
  });

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  int seconds = 0;
  Timer? timer;
  bool isRunning = false;

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        setState(() {
          seconds++;
        });
      },
    );

    setState(() {
      isRunning = true;
    });
  }

  void stopTimer() {
    timer?.cancel();

    setState(() {
      isRunning = false;
    });
  }

  String formatTime() {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');

    return '$minutes:$secs';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isRunning ? stopTimer : startTimer,
              child: Text(
                isRunning ? 'Parar' : 'Iniciar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
