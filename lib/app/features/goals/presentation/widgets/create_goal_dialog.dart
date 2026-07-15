import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/design_system/foundations/spacing/kanboard_ds_spacing.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/features/goals/domain/entities/goal_entity.dart';
import 'package:kan_board_web/app/features/goals/presentation/cubit/goal_cubit.dart';

class CreateGoalDialog extends StatefulWidget {
  const CreateGoalDialog({super.key});

  @override
  State<CreateGoalDialog> createState() => _CreateGoalDialogState();
}

class _CreateGoalDialogState extends State<CreateGoalDialog> {
  final _titleController = TextEditingController();

  DateTime? _examDate;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _selectExamDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        _examDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(context.read<GoalsCubit>().toString());

    return Dialog(
      child: SizedBox(
        width: 420,
        child: Padding(
          padding: const EdgeInsets.all(KanBoardDSSpacing.space24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Novo plano de estudo',
                style: KanBoardDSTextStyles.titleLarge(context),
              ),
              const SizedBox(height: KanBoardDSSpacing.space8),
              Text(
                'Crie um novo objetivo para organizar seus estudos.',
                style: KanBoardDSTextStyles.bodyMedium(context),
              ),
              const SizedBox(height: KanBoardDSSpacing.space24),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  hintText: 'Ex: ENEM 2027',
                ),
              ),
              const SizedBox(height: KanBoardDSSpacing.space16),
              OutlinedButton.icon(
                onPressed: _selectExamDate,
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  _examDate == null
                      ? 'Selecionar data da prova'
                      : '${_examDate!.day}/${_examDate!.month}/${_examDate!.year}',
                ),
              ),
              const SizedBox(height: KanBoardDSSpacing.space32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(width: KanBoardDSSpacing.space12),
                  FilledButton(
                    onPressed: () {
                      context.read<GoalsCubit>().createGoal(
                        goal: GoalEntity(
                          id: '',
                          title: _titleController.text,
                          examDate: _examDate,
                        ),
                      );

                      Navigator.pop(context);
                    },
                    child: const Text('Criar plano'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
