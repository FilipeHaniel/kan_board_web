import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/spacing/kanboard_ds_spacing.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/core/design_system/primitives/button/kanboard_ds_button.dart';

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
        title: Text(
          widget.taskTitle,
          style: KanBoardDSTextStyles.titleLarge(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(),
              style: KanBoardDSTextStyles.displayMedium(context),
            ),
            const SizedBox(
              height: KanBoardDSSpacing.space20,
            ),
            KanBoardDSButton(
              text: isRunning ? 'Parar' : 'Iniciar',
              onPressed: isRunning ? stopTimer : startTimer,
            ),
          ],
        ),
      ),
    );
  }
}
