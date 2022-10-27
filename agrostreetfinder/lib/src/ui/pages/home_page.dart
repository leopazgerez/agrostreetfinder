import 'package:agrostreetfinder/src/ui/pagecomponent/map_page_component.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../pagecomponent/custom_expandable_button_page_component.dart';
import '../pagecomponent/custom_tab_bar_page_component.dart';
import '../pagecomponent/home_drawer.dart';
import '../pagecontrollers/home_page_controllers.dart';
import 'load_track_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> with TickerProviderStateMixin {
  final HomePageController _con = HomePageController.con;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _con.initPage();
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: CustomTabBarComponent(tabController: tabController),
          centerTitle: true,
          title: const Text('Home'),
          leading: IconButton(
            onPressed: _openDrawer,
            iconSize: 30,
            icon: const Icon(Icons.list),
          ),
        ),
        //El widget de Maps solo debe ir dentro de widget con las dimensiones definidas
        // Puede ir dentro de un container, sizeBox o directamente Body de scaffold.
        body: _tabBarView(tabController),
        floatingActionButton: CustomExpandableButtonComponent(
          distance: 70,
          children: [
            AnimationButton(
              icon: const Icon(Icons.route_outlined),
              onPressed: () => _con.goToLoadFieldPage(context),
            ),
            AnimationButton(
              icon: const Icon(Icons.place_outlined),
              onPressed: () => _con.goToLoadPointPage(context),
            ),
          ],
        ),
        drawer: NavigationDrawer(
          lot: _con.lot,
          onPressed: _closeDrawer,
        ));
  }

  TabBarView _tabBarView(TabController tabController) {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          MapPageComponent(points: _con.points, lots: _con.lot,),
          // Text('Rutas'),
          Text('Rutas'),
          Text('Favoritos'),
        ]);
  }
}


  // Wrap(
  //   runSpacing: 10,
  //   children: [
  //     ListTile(
  //       leading: const Icon(Icons.route_outlined),
  //       title: const Text('Caminos'),
  //       onTap: () {
  //         Navigator.pop(context);
  //         Navigator.of(context).pushReplacement(MaterialPageRoute(
  //             builder: (context) => const LoadTrackPage()));
  //       },
  //     )
  //   ],
  // );

