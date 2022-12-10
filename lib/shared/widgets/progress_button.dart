import 'package:flutter/material.dart';
import 'package:custom_state/custom_state.dart';

import '../../base/theme/components.dart';

class ProgressButton extends StatelessWidget {
  const ProgressButton({
    Key? key,
    required this.label,
    required this.states,
    required this.onTab,
  }) : super(key: key);

  final Function() onTab;
  final Set<ButtonState> states;
  final String label;

  @override
  Widget build(BuildContext context) => AbsorbPointer(
        absorbing: states.contains(ButtonState.disabled) ||
            states.contains(ButtonState.forceDisabled),
        child: StateButton(
          onTap: (customState) => onTab(),
          initial: Text(label),
          states: states,
          style: Component.progressButton,
        ),
      );
}
