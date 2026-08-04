import 'package:flutter/material.dart';

class KanboardDsInlineCreateCard extends StatefulWidget {
  final String buttonLabel;
  final String hint;
  final Future<void> Function(String value) onSave;

  const KanboardDsInlineCreateCard({
    super.key,
    required this.buttonLabel,
    required this.hint,
    required this.onSave,
  });

  @override
  State<KanboardDsInlineCreateCard> createState() =>
      _KanboardDsInlineCreateCardState();
}

class _KanboardDsInlineCreateCardState
    extends State<KanboardDsInlineCreateCard> {
  final _controller = TextEditingController();

  bool _editing = false;
  bool _loading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final value = _controller.text.trim();

    if (value.isEmpty) return;

    setState(() => _loading = true);

    await widget.onSave(value);

    if (!mounted) return;

    _controller.clear();

    setState(() {
      _loading = false;
      _editing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_editing) {
      return OutlinedButton.icon(
        onPressed: () {
          setState(() {
            _editing = true;
          });
        },
        icon: const Icon(Icons.add),
        label: Text(widget.buttonLabel),
      );
    }

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                autofocus: true,
                onSubmitted: (_) => _save(),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: _loading ? null : _save,
              icon: _loading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.check),
            ),
            IconButton(
              onPressed: _loading
                  ? null
                  : () {
                      _controller.clear();

                      setState(() {
                        _editing = false;
                      });
                    },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
