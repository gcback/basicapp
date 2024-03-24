import 'package:flutter/foundation.dart';
import 'package:mylib/mylib.dart';

import '../component.dart';
import 'hook_sideeffect.dart';

class ActionButton extends HookWidget {
  const ActionButton({
    super.key,
    required this.onPressed,
    this.label,
    required this.icon,
  });
  final AsyncCallback onPressed;
  final Widget? label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final (clear: _, :mutate, :snapshot) = useSideEffect<void>();

    Future<void> pressButton() async {
      final future = onPressed();
      mutate(future);
      try {
        await future;
      } catch (exception) {
        if (!context.mounted) return;

        showSnackBar('Something went wrong $exception');
      }
    }

    final activeIcon = switch (snapshot) {
      AsyncSnapshot(connectionState: ConnectionState.waiting) => const LoadingSpinner(size: 16.0),
      _ => icon,
    };
    final callback = switch (snapshot) {
      AsyncSnapshot(connectionState: ConnectionState.waiting) => null,
      _ => pressButton,
    };

    return Center(
      child: label != null
          ? OutlinedButton.icon(
              onPressed: callback,
              label: label!,
              icon: activeIcon,
            )
          : IconButton(
              onPressed: callback,
              icon: activeIcon,
            ),
    );
  }
}
