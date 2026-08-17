import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/core/di/injector.dart';
import 'package:kan_board_web/app/core/layout/app_layout.dart';
import 'package:kan_board_web/app/core/routes/app_routes.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/widgets/subject_card.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

class DashboardPage extends StatelessWidget {
  final GoalEntity goal;

  const DashboardPage({
    super.key,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DashboardCubit>()..loadDashboard(goal),
      child: AppLayout(
        goal: goal,
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return switch (state) {
              DashboardInitial() => const SizedBox.shrink(),

              DashboardLoading() => const Center(
                child: CircularProgressIndicator(),
              ),

              DashboardSuccess(
                :final goal,
                :final subjects,
              ) =>
                _DashboardContent(
                  goal: goal,
                  subjects: subjects,
                  onCreateSubject: () {
                    // Vamos implementar depois.
                  },
                  onSubjectTap: (subject) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.subject,
                      arguments: {
                        'goal': goal,
                        'subject': subject,
                        'dashboardCubit': context.read<DashboardCubit>(),
                      },
                    );
                  },
                ),

              DashboardError(:final message) => Center(
                child: Text(
                  message,
                  style: KanBoardDSTextStyles.error(context),
                ),
              ),

              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  final GoalEntity goal;
  final List<DashboardSubjectEntity> subjects;
  final VoidCallback onCreateSubject;
  final ValueChanged<DashboardSubjectEntity> onSubjectTap;

  const _DashboardContent({
    required this.goal,
    required this.subjects,
    required this.onCreateSubject,
    required this.onSubjectTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goal.title,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Minhas matérias',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              FilledButton.icon(
                onPressed: onCreateSubject,
                icon: const Icon(Icons.add),
                label: const Text('Nova matéria'),
              ),
            ],
          ),
          const SizedBox(height: 32),
          if (subjects.isEmpty)
            _EmptySubjects(
              onCreateSubject: onCreateSubject,
            )
          else
            _SubjectsGrid(
              subjects: subjects,
              onSubjectTap: onSubjectTap,
            ),
        ],
      ),
    );
  }
}

class _SubjectsGrid extends StatelessWidget {
  final List<DashboardSubjectEntity> subjects;
  final ValueChanged<DashboardSubjectEntity> onSubjectTap;

  const _SubjectsGrid({
    required this.subjects,
    required this.onSubjectTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: subjects.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 320,
        mainAxisExtent: 190,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final subject = subjects[index];

        return SubjectCard(
          subject: subject,
          onTap: () => onSubjectTap(subject),
        );
      },
    );
  }
}

class _EmptySubjects extends StatelessWidget {
  final VoidCallback onCreateSubject;

  const _EmptySubjects({
    required this.onCreateSubject,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            Icon(
              Icons.menu_book_outlined,
              size: 48,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'Nenhuma matéria cadastrada',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Comece adicionando uma matéria ao seu objetivo.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onCreateSubject,
              icon: const Icon(Icons.add),
              label: const Text('Nova matéria'),
            ),
          ],
        ),
      ),
    );
  }
}
