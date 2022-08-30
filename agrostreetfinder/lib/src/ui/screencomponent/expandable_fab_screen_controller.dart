import 'dart:math' as math;
import 'package:flutter/material.dart';


//Coordina la expansion y colapso de otros botones
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

//Toma como parametros el estado de inicio, la distancia de cada botón
// y una lista de children donde se van a guardar los botones.
  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

  class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {
    late final AnimationController _controller;
    late final Animation<double> _expandAnimation;
    bool _open = false;

    // Metodo abtsracto sobreescrito para que cuando se inicialice se le asigne un widget
    @override
    void initState() {
      super.initState();
      _open = widget.initialOpen ?? false;
      _controller = AnimationController(
        value: _open ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        vsync: this,
      );
      _expandAnimation = CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeOutQuad,
        parent: _controller,
      );
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }


    // Metodo que modifica el estado del widget cuando es presionado
    void _toggle() {
      setState(() {
        _open = ! _open;
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
            _buildTapToCloseFab(),
            ..._buildExpandingActionButtons(),
            _buildTapToOpenFab(),
          ],

        ),
      );
    }


// Widget por el que va a cambiar una vez desplegados los iconos agregados (despues de ser presionado)
    Widget _buildTapToCloseFab() {
      return SizedBox(
        width: 56,
        height: 56,
        child: Center(
          child: Material(
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            elevation: 4,
            // clase que expande o reduce el widget
            child: InkWell(
              // mouseCursor: MouseCursor.defer,
              onTap: _toggle,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.close,
                    color: Theme
                        .of(context)
                        .primaryColor),
              ),
            ),
          ),
        ),
      );
    }


    // lista de widgets que va a recibir la clase ExpandableFab que son los widgets
    // que se van a desplazar una vez presionado el boton
    List<Widget> _buildExpandingActionButtons() {
      final children = <Widget>[];
      final count = widget.children.length;
      final step = 90.0 / (count - 1);
      for (var i = 0, angleInDegrees = 0.0;
      i < count;
      i++, angleInDegrees += step) {
        children.add(
          _ExpandingActionButton(
            directionInDegrees: angleInDegrees,
            maxDistance: widget.distance,
            progress: _expandAnimation,
            child: widget.children[i],
          ),
        );
      }
      return children;
    }


    // Widget que va mostrar el icono de agregar (antes de ser presionado)
    // en este widget no va un Inkwell ya que es el primario
    Widget _buildTapToOpenFab() {
      return IgnorePointer(
        ignoring: _open,
        child: AnimatedContainer(
          transformAlignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            _open ? 0.7 : 1.0,
            _open ? 0.7 : 1.0,
            1.0,
          ),
          duration: const Duration(milliseconds: 250),
          curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
          child: AnimatedOpacity(
            opacity: _open ? 0.0 : 1.0,
            curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
            duration: const Duration(milliseconds: 250),
            child: FloatingActionButton(
              onPressed: _toggle,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      );
    }


  }

  // clase que se encarga de animar un determinado widget
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  // se sobreescribe con los parametros de la aniamcion que se requiere
  // en este caso es un desplazamiento con rotacion del widget
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        // metodo que settea el angulo con el que se van a abrir los iconos
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 270.0),
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













