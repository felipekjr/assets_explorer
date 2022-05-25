import 'package:flutter/material.dart';

import '../theme/theme.dart';

class MenuItem extends StatefulWidget {
  final Icon? icon;
  final String label;
  final VoidCallback onClick;
  final bool disabled;

  const MenuItem({
    Key? key,
    this.icon,
    this.disabled = false,
    required this.label,
    required this.onClick
  }) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  Color backgroundColor = AppColor.secondary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !widget.disabled ? widget.onClick : null,
      child: MouseRegion(
        onHover: (_) {
          if (!widget.disabled) {
            setState(() => backgroundColor = AppColor.primary);
          }
        },
        onExit: (_) {
          setState(() => backgroundColor = AppColor.secondary);
        },
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.x1,
              vertical: Spacing.x2
            ),
            child: Opacity(
              opacity: widget.disabled ? .5 : 1,
              child: Row(children: [
                const SizedBox(width: Spacing.x1),
                widget.icon ?? const SizedBox.shrink(),
                const SizedBox(width: Spacing.x2),
                Text(widget.label, style: TextStyles.medium(color: Colors.white))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}