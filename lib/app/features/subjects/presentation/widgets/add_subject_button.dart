import 'package:flutter/material.dart';

class AddSubjectButton extends StatefulWidget {
  final Future<void> Function(String name) onCreate;

  const AddSubjectButton({
    super.key,
    required this.onCreate,
  });

  @override
  State<AddSubjectButton> createState() => _AddSubjectButtonState();
}

class _AddSubjectButtonState extends State<AddSubjectButton> {
  final _controller = TextEditingController();

  bool _isCreating = false;
  bool _loading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _loading = true;
    });

    await widget.onCreate(
      _controller.text.trim(),
    );

    _controller.clear();

    if (!mounted) return;

    setState(() {
      _loading = false;
      _isCreating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCreating) {
      return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            _isCreating = true;
          });
        },
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              SizedBox(width: 8),
              Text(
                'Nova matéria',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Nome da matéria',
            ),
            onSubmitted: (_) => _save(),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              FilledButton(
                onPressed: _loading ? null : _save,
                child: _loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Text('Salvar'),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: _loading
                    ? null
                    : () {
                        _controller.clear();

                        setState(() {
                          _isCreating = false;
                        });
                      },
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
