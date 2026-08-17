import 'package:flutter/material.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';

class SubjectCard extends StatelessWidget {
  final DashboardSubjectEntity subject;
  final VoidCallback onTap;

  const SubjectCard({
    super.key,
    required this.subject,
    required this.onTap,
  });

  int get divisionsCount {
    return subject.divisions.length;
  }

  int get contentsCount {
    return subject.divisions.fold(
      0,
      (total, division) {
        return total + division.contents.length;
      },
    );
  }

  int get tasksCount {
    return subject.divisions.fold(
      0,
      (total, division) {
        return total +
            division.contents.fold(
              0,
              (total, content) {
                return total + content.tasks.length;
              },
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(
                        alpha: 0.1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.menu_book_outlined,
                      color: colorScheme.primary,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                subject.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  _SubjectStat(
                    icon: Icons.account_tree_outlined,
                    label: '$divisionsCount frentes',
                  ),
                  const SizedBox(width: 16),
                  _SubjectStat(
                    icon: Icons.task_alt_outlined,
                    label: '$tasksCount tarefas',
                  ),
                ],
              ),

              if (contentsCount > 0) ...[
                const SizedBox(height: 8),
                Text(
                  '$contentsCount conteúdos',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SubjectStat extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SubjectStat({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
