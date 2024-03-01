import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../design_system.dart';

class DefaultCheckbox extends StatelessWidget {
  const DefaultCheckbox({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(12),
        color: value ? PrimaryColors.brand : Colors.transparent,
        border: Border.all(
          color: value ? PrimaryColors.brand : PrimaryColors.brand.v100,
        ),
      ),
      height: 32,
      width: 32,
      child: Animate(
        target: value ? 1 : 0,
        effects: const [
          FadeEffect(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
          ),
          ScaleEffect(
            begin: Offset(0.7, 0.7),
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
          ),
          MoveEffect(
            begin: Offset(0, 5),
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
          ),
        ],
        child: const Icon(
          PhosphorIconsBold.check,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
