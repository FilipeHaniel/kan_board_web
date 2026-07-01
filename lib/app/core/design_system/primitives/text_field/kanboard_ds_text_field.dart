import 'package:flutter/material.dart';
import 'package:kan_board_web/app/core/design_system/foundations/colors/kanboard_ds_light_color_scheme.dart';
import 'package:kan_board_web/app/core/design_system/foundations/spacing/kanboard_ds_spacing.dart';
import 'package:kan_board_web/app/core/design_system/primitives/text_field/internal/kanboard_ds_text_field_style_resolver.dart';
import 'package:kan_board_web/app/core/design_system/primitives/text_field/kanboard_ds_text_field_size.dart';

class KanBoardDSTextField extends StatefulWidget {
  const KanBoardDSTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.minLines,
    this.size = KanBoardDSTextFieldSize.medium,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;

  final bool enabled;
  final bool readOnly;
  final bool obscureText;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  final Widget? prefix;
  final Widget? suffix;

  final int? minLines;
  final int maxLines;

  final KanBoardDSTextFieldSize size;

  @override
  State<KanBoardDSTextField> createState() => _KanBoardDSTextFieldState();
}

class _KanBoardDSTextFieldState extends State<KanBoardDSTextField> {
  late final FocusNode _focusNode;

  bool _hovered = false;
  bool _ownsFocusNode = false;

  bool get _focused => _focusNode.hasFocus;

  @override
  void initState() {
    super.initState();

    _ownsFocusNode = widget.focusNode == null;
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(_handleFocusChanged);
  }

  void _handleFocusChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChanged);

    if (_ownsFocusNode) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = KanBoardDSTextFieldStyleResolver.resolve(
      colors: kanBoardDSLightColorScheme,
      size: widget.size,
      enabled: widget.enabled,
      hovered: _hovered,
      focused: _focused,
      hasError: widget.errorText != null,
    );

    return MouseRegion(
      cursor: widget.enabled
          ? SystemMouseCursors.text
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: style.labelStyle.copyWith(
                color: style.labelColor,
              ),
            ),
            const SizedBox(
              height: KanBoardDSSpacing.space8,
            ),
          ],
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            height: widget.maxLines == 1 ? style.height : null,
            decoration: BoxDecoration(
              color: style.backgroundColor,
              borderRadius: style.borderRadius,
              border: Border.all(
                color: style.borderColor,
              ),
            ),
            child: Row(
              children: [
                if (widget.prefix != null) ...[
                  const SizedBox(width: KanBoardDSSpacing.space16),
                  IconTheme(
                    data: IconThemeData(
                      color: style.hintColor,
                      size: 18,
                    ),
                    child: widget.prefix!,
                  ),
                ],
                Expanded(
                  child: Padding(
                    padding: style.contentPadding,
                    child: TextField(
                      controller: widget.controller,
                      focusNode: _focusNode,
                      enabled: widget.enabled,
                      readOnly: widget.readOnly,
                      obscureText: widget.obscureText,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      cursorColor: style.cursorColor,
                      style: style.textStyle.copyWith(
                        color: style.textColor,
                      ),
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: style.hintStyle,
                      ),
                      onChanged: widget.onChanged,
                      onSubmitted: widget.onSubmitted,
                    ),
                  ),
                ),
                if (widget.suffix != null) ...[
                  IconTheme(
                    data: IconThemeData(
                      color: style.hintColor,
                      size: 18,
                    ),
                    child: widget.suffix!,
                  ),
                  const SizedBox(width: KanBoardDSSpacing.space16),
                ],
              ],
            ),
          ),
          if (widget.errorText != null) ...[
            const SizedBox(
              height: KanBoardDSSpacing.space8,
            ),
            Text(
              widget.errorText!,
              style: style.errorStyle,
            ),
          ] else if (widget.helperText != null) ...[
            const SizedBox(
              height: KanBoardDSSpacing.space8,
            ),
            Text(
              widget.helperText!,
              style: style.helperStyle,
            ),
          ],
        ],
      ),
    );
  }
}
