import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/widgets/division_section.dart';

class SubjectSection extends StatelessWidget {
  final DashboardSubjectEntity subject;
  final Function(DashboardTaskEntity, String) onTaskDropped;

  const SubjectSection({
    super.key,
    required this.subject,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subject.name,
          style: KanBoardDSTextStyles.headlineLarge(context),
        ),
        const SizedBox(height: 24),
        ...subject.divisions.map(
          (division) => Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: DivisionSection(
              division: division,
              onTaskDropped: onTaskDropped,
            ),
          ),
        ),
      ],
    );
  }
}
