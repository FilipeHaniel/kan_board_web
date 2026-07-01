import 'package:flutter/material.dart';

import '../../foundations/colors/kanboard_ds_light_color_scheme.dart';
import '../../foundations/spacing/kanboard_ds_spacing.dart';
import 'internal/kanboard_ds_button_style_resolver.dart';
import 'kanboard_ds_button_size.dart';
import 'kanboard_ds_button_variant.dart';

class KanBoardDSButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final KanBoardDSButtonVariant variant;
  final KanBoardDSButtonSize size;
  final bool loading;
  final Widget? leading;
  final Widget? trailing;

  const KanBoardDSButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = KanBoardDSButtonVariant.primary,
    this.size = KanBoardDSButtonSize.medium,
    this.loading = false,
    this.leading,
    this.trailing,
  });

  @override
  State<KanBoardDSButton> createState() => _KanBoardDSButtonState();
}

class _KanBoardDSButtonState extends State<KanBoardDSButton> {
  bool _hovered = false;
  bool _pressed = false;

  bool get _enabled => widget.onPressed != null && !widget.loading;

  @override
  Widget build(BuildContext context) {
    final style = KanBoardDSButtonStyleResolver.resolve(
      colors: kanBoardDSLightColorScheme,
      variant: widget.variant,
      size: widget.size,
      enabled: _enabled,
      hovered: _hovered,
      pressed: _pressed,
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 88),
      child: MouseRegion(
        cursor: widget.loading
            ? SystemMouseCursors.progress
            : _enabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onEnter: (_) {
          if (!_enabled) return;
          setState(() => _hovered = true);
        },
        onExit: (_) {
          if (!_enabled) return;
          setState(() {
            _hovered = false;
            _pressed = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          height: style.height,
          decoration: BoxDecoration(
            color: style.backgroundColor,
            borderRadius: style.borderRadius,
            border: Border.all(
              color: style.borderColor,
              width: style.borderWidth,
            ),
            boxShadow: style.boxShadows,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _enabled ? widget.onPressed : null,
              borderRadius: style.borderRadius,
              mouseCursor: widget.loading
                  ? SystemMouseCursors.progress
                  : _enabled
                  ? SystemMouseCursors.click
                  : SystemMouseCursors.basic,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onHighlightChanged: (pressed) {
                if (!_enabled) return;
                setState(() => _pressed = pressed);
              },
              child: Padding(
                padding: style.padding,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.leading != null) ...[
                      IconTheme(
                        data: IconThemeData(
                          color: style.foregroundColor,
                          size: 18,
                        ),
                        child: widget.leading!,
                      ),
                      const SizedBox(width: KanBoardDSSpacing.space8),
                    ],

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      child: widget.loading
                          ? SizedBox(
                              key: const ValueKey('loading'),
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation(
                                  style.foregroundColor,
                                ),
                              ),
                            )
                          : Text(
                              widget.text,
                              key: const ValueKey('text'),
                              style: style.textStyle.copyWith(
                                color: style.foregroundColor,
                              ),
                            ),
                    ),

                    if (widget.trailing != null) ...[
                      const SizedBox(width: KanBoardDSSpacing.space8),
                      IconTheme(
                        data: IconThemeData(
                          color: style.foregroundColor,
                          size: 18,
                        ),
                        child: widget.trailing!,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
