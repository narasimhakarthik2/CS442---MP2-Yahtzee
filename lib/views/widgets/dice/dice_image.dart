import 'package:flutter/material.dart';

class DiceImage extends StatelessWidget {
  final int? value;
  final bool held;
  final Function(bool) onHoldChanged;

  const DiceImage({
    Key? key,
    required this.value,
    required this.held,
    required this.onHoldChanged,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: value != null ? () => onHoldChanged(!held) : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: value == null ? Colors.white : null,
            border: value == null
                ? Border.all()
                : held
                ? Border.all(
                width: 4, color: Colors.red) // Red border for held dice
                : null, // No border when not held
            borderRadius: BorderRadius.circular(8),
          ),
          child: value != null
              ? Image.asset(
            'assets/images/dice_$value.png',
            width: 64,
            height: 64,
            fit: BoxFit.contain,
          )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
