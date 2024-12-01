import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: 60,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: widget.value
                ? Theme.of(context).primaryColor
                : Theme.of(context).cardColor,
            border: Border.all(
                color: widget.value
                    ? Theme.of(context).primaryColor
                    : Colors.grey)),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: widget.value ? 35 : 0,
              top: 2,
              bottom: 2,
              right: widget.value ? 0 : 35,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      widget.value ? Theme.of(context).cardColor : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
