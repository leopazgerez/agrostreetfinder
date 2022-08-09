import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget{
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
});

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context){
    // Aplica los colores a todos los widgets
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color:  theme.colorScheme.secondary,
      elevation: 4,
      child: IconButton(
          onPressed: onPressed,
          icon: icon,
          color: theme.colorScheme.secondary,
      ),
    );
  }
}
