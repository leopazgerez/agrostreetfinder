import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomExpandableButtonComponent extends StatefulWidget {
  const CustomExpandableButtonComponent(
      {Key? key,
      this.initialOpen,
      required this.distance,
      required this.children})
      : super(key: key);

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<CustomExpandableButtonComponent> createState() => _CustomExpandableButtonComponentState();
}

class _CustomExpandableButtonComponentState extends State<CustomExpandableButtonComponent>
    with SingleTickerProviderStateMixin {
  late bool _open = false;
  late AnimationController _controller;
  late Animation _buttonTurnAnimation;
  late Animation _buttonColorAnimation;
  late Animation _buttonBackgroundColorAnimation;
  late Animation<double> _expandAnimation;

//  Sobreescribo el metodo q se ejecuta antes de la construccion del widget para asegurarme que si no tiene ningun
//  valor booleano asignado para su inicio, se le asigne False.
  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;

    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
    _buttonTurnAnimation = Tween<double>(begin: 0.0, end: 0.8).animate(_controller);
    _buttonColorAnimation = ColorTween(begin: Colors.black, end: Colors.red).animate(_controller);
    _buttonBackgroundColorAnimation = ColorTween(begin: Colors.white, end: Colors.grey).animate(_controller);
  }

  void _onTap() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          ..._buildExpandingActionButtons(),
          _buildTapToClose(),
          // _buildTapToOpen(),
        ],
      ),
    );
  }

//  Metodo que retorna el boton que va a mostrar los botones ocultos.
  Widget _buildTapToClose() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: 56.0,
          height: 56.0,
          child: Center(
            child: Material(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              elevation: 4.0,
              child: InkWell(
                splashColor: _open ? Colors.redAccent : Colors.grey,
                hoverColor: Colors.black,
                // highlightColor: Colors.black,
                onTap: _onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform.rotate(
                    angle: _buttonTurnAnimation.value,
                    child: Icon(
                      Icons.add,
                      color: _buttonColorAnimation.value,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

//  Este metodo construye el boton que va a estar por debajo en el stack, pero por el momento decidi no usarlo
  Widget _buildTapToOpen() {
    return IgnorePointer(
        ignoring: _open,
        child: AnimatedContainer(
          transformAlignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            _open ? 0.7 : 1.0, //x
            _open ? 0.7 : 1.0, //y
            1.0, //z
          ),
          duration: const Duration(milliseconds: 250),
          child: AnimatedOpacity(
              opacity: _open ? 0 : 1,
              duration: const Duration(milliseconds: 250),
              child: FloatingActionButton(
                clipBehavior: Clip.antiAlias,
                onPressed: _onTap,
                child: const Icon(
                  Icons.close,
                ),
              )),
        ));
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
    i < count;
    i++, angleInDegrees += step) {
      children.add(
        ExpandingButtonAction(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }
}

// Creo una clase personalizada para los botones que van a mostrarse en el stack
class AnimationButton extends StatelessWidget {
  const AnimationButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);
  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
//  Theme es un InheritedWidget que permite el acceso desde el padre a sus atributos.
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.secondary,
      elevation: 5,
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}

class ExpandingButtonAction extends StatelessWidget {
  const ExpandingButtonAction(
      {Key? key,
      required this.directionInDegrees,
      required this.maxDistance,
      required this.progress,
      required this.child})
      : super(key: key);
  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 320.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
