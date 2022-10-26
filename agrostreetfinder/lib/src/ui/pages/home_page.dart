import 'package:agrostreetfinder/src/ui/pagecomponent/map_page_component.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../pagecomponent/custom_expandable_button_page_component.dart';
import '../pagecomponent/custom_tab_bar_page_component.dart';
import '../pagecontrollers/home_page_controllers.dart';
import 'load_track_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> with TickerProviderStateMixin{

  final HomePageController _con = HomePageController.con;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      floatingActionButton: CustomExpandableButtonComponent(distance: 70, children: [
        AnimationButton(
          icon: const Icon(Icons.route_outlined),
          onPressed: () => _con.goToLoadFieldPage(context),
        ),
        AnimationButton(
          icon: const Icon(Icons.place_outlined),
          onPressed: () => _con.goToLoadPointPage(context) ,
        ),
      ],
      ),
      drawer: NavegationDrawer(onPressed: _closeDrawer,)
    );
  }

  TabBarView _tabBarView(TabController tabController){
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
         MapPageComponent(),
      Text('Puta'),
      Text('Que te'),
    ]);
  }
}
class NavegationDrawer extends StatelessWidget{
  final VoidCallback? onPressed;
  NavegationDrawer ({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Drawer(
      backgroundColor: Colors.green,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            AppBar(
              centerTitle: true,
                      title: const Text('Menu'),
                      leading: IconButton(
                          onPressed: onPressed,
                          iconSize: 30,
                          icon: const Icon(Icons.arrow_back_rounded)),

            ),
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }



  Widget buildHeader(BuildContext context) => Container(
    // MediaQuery es una clase que hace que el widget se adapte a al tamano de la pantalla
    //hace que el widget sea responsivo. Esto significa que que el Widget se reconstruye
    //en base al  tamano de pantalla del dispositivo en el que cual se esta ejecutando la app
    padding: EdgeInsets.only(
      //en este metodo lo que esta haciendo es adaptar la parte de arriba del contenedor
      // en base a
      top: MediaQuery.of(context).padding.top
    ),
  );

  Widget buildMenuItems(BuildContext context) => Wrap(
    runSpacing: 10,
    children: [
      ListTile(
        leading: const Icon(Icons.place_outlined),
        title: const Text('Lotes'),
        onTap: (){},
      ),
      ListTile(
        leading: const Icon(Icons.route_outlined),
        title: const Text('Caminos'),
        onTap: (){
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LoadTrackPage()));
        },
      )
    ],
  );

}

