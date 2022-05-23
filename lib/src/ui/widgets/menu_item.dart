import 'package:flutter/material.dart';

import '../theme/theme.dart';

class MenuItem extends StatefulWidget {
  final Icon? icon;
  final String label;
  final VoidCallback onClick;

  const MenuItem({
    Key? key,
    this.icon,
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
      onTap: widget.onClick,
      child: MouseRegion(
        onHover: (_) {
          setState(() => backgroundColor = AppColor.primary);
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
            child: Row(children: [
              const SizedBox(width: Spacing.x1),
              widget.icon ?? const SizedBox.shrink(),
              const SizedBox(width: Spacing.x2),
              Text(widget.label, style: TextStyles.medium(color: Colors.white))
            ]),
          ),
        ),
      ),
    );
  }
}