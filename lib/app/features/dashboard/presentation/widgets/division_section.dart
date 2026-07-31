import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/widgets/content_section.dart';

class DivisionSection extends StatelessWidget {
  final DashboardDivisionEntity division;
  final Function(DashboardTaskEntity, String) onTaskDropped;

  const DivisionSection({
    super.key,
    required this.division,
    required this.onTaskDropped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          division.name,
          style: KanBoardDSTextStyles.titleLarge(context),
        ),
        const SizedBox(height: 16),
        ...division.contents.map(
          (content) => ContentSection(
            content: content,
            onTaskDropped: onTaskDropped,
          ),
        ),
      ],
    );
  }
}
