import 'package:flutter/material.dart';

class CustomTabBarComponent extends StatefulWidget implements PreferredSizeWidget{
    @override
  final Size preferredSize;
    final TabController tabController;
    final PreferredSizeWidget? bottom;
    final double? toolbarHeight;
    CustomTabBarComponent({super.key, this.toolbarHeight, this.bottom, required this.tabController}) :  preferredSize = _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
  @override
  State<CustomTabBarComponent> createState() => _CustomTabBarComponentState();
}

class _CustomTabBarComponentState extends State<CustomTabBarComponent> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      indicatorColor: const Color(0xFFC8E6C9),
      tabs:  (const <Widget>[
        Tab(icon: Icon(Icons.place_outlined)),
        Tab(
          icon: Icon(Icons.route_outlined),
        ),
        Tab(
          icon: Icon(Icons.star_border),
        ),
      ]),
    );
  }
}
class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}