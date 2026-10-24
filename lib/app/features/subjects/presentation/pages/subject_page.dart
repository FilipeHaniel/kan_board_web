import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/core/layout/app_layout.dart';
import 'package:kan_board_web/app/core/layout/content/kanban_area.dart';
import 'package:kan_board_web/app/features/dashboard/domain/entities/dashboard_subject_entity.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:kan_board_web/app/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';

class SubjectPage extends StatelessWidget {
  final GoalEntity goal;
  final DashboardSubjectEntity subject;

  const SubjectPage({
    super.key,
    required this.goal,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      goal: goal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8),
                Text(
                  subject.name,
                  style: KanBoardDSTextStyles.headlineLarge(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return switch (state) {
                  DashboardLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  DashboardSuccess(:final subjects) => _buildKanban(
                    context,
                    subjects,
                  ),
                  DashboardError(:final message) => Center(
                    child: Text(message),
                  ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKanban(
    BuildContext context,
    List<DashboardSubjectEntity> subjects,
  ) {
    DashboardSubjectEntity? currentSubject;

    for (final item in subjects) {
      if (item.id == subject.id) {
        currentSubject = item;
        break;
      }
    }

    if (currentSubject == null) {
      return const Center(
        child: Text('Matéria não encontrada.'),
      );
    }

    // Estado vazio: ainda não existem conteúdos nesta matéria.
    if (currentSubject.contents.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.library_add_outlined,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Nenhum conteúdo cadastrado',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Crie o primeiro conteúdo para começar a organizar suas tarefas.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => _showCreateContentDialog(
                  context,
                  currentSubject!.id,
                ),
                icon: const Icon(Icons.add),
                label: const Text('Criar conteúdo'),
              ),
            ],
          ),
        ),
      );
    }

    return KanbanArea(
      subject: currentSubject,
      onTaskDropped: (task, status) {
        context.read<DashboardCubit>().moveTask(
          taskId: task.id,
          status: status,
        );
      },
    );
  }

  Future<void> _showCreateContentDialog(
    BuildContext context,
    String subjectId,
  ) async {
    final controller = TextEditingController();

    final name = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Novo conteúdo'),
          content: TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Nome do conteúdo',
              hintText: 'Ex.: Introdução à matéria',
            ),
            onSubmitted: (value) {
              final trimmedName = value.trim();
              if (trimmedName.isNotEmpty) {
                Navigator.of(dialogContext).pop(trimmedName);
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                final trimmedName = controller.text.trim();
                if (trimmedName.isNotEmpty) {
                  Navigator.of(dialogContext).pop(trimmedName);
                }
              },
              child: const Text('Criar'),
            ),
          ],
        );
      },
    );

    controller.dispose();

    if (name == null || name.isEmpty || !context.mounted) {
      return;
    }

    await context.read<DashboardCubit>().createContent(
      subjectId: subjectId,
      name: name,
    );
  }
}
