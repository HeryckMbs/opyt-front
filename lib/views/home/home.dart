import 'package:financas_front_1/views/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void updatePage(index) {}

  @override
  void initState() {
    Function refresh = () {
      setState(() {});
    };
    super.initState();
  }

  final List<String> titles = ['Tela inicial', 'Eventos', 'Tela terciária', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),

      appBar: AppBar(
          backgroundColor: Color(0xFFFAFAFA),
          title: Text('Home'),
          // Botão de hambúrguer
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  // Abra o Drawer
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )),
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.7,
              child:  PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.red,
            value: 40,
            title: '40%',
            radius: 50,
          ),
          PieChartSectionData(
            color: Colors.blue,
            value: 30,
            title: '30%',
            radius: 45,
          ),
          PieChartSectionData(
            color: Colors.green,
            value: 20,
            title: '20%',
            radius: 40,
          ),
          PieChartSectionData(
            color: Colors.yellow,
            value: 10,
            title: '10%',
            radius: 35,
          ),
        ],
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, PieTouchResponse? response) {
            if (!event.isInterestedForInteractions ||
                response == null ||
                response.touchedSection == null) {
              return;
            }
            // Handle touch events here
          },
        ),
      ),
    ),
            );
          },
        ),
      ),

      // Drawer para o menu de hambúrguer
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: StandardTheme.homeColor,
              ),
              child: Text('Finanças do Heryck',style: TextStyle(color: Colors.white),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                  color:  StandardTheme.badge,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                      color: Colors.black),
                ),
                leading: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                onTap: () {
                  setState(() {
                  });
                  // Update the state of the app
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tela 1'),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tela 3'),
    );
  }
}

class Menu extends StatefulWidget {
  Menu({super.key, required this.parent});

  BuildContext parent;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu de Hambúrguer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Opção 1'),
            onTap: () {
              // Adicione o código para ação quando a opção 1 for selecionada
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Opção 2'),
            onTap: () {
              // Adicione o código para ação quando a opção 2 for selecionada
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Opção 3'),
            onTap: () {
              // Adicione o código para ação quando a opção 3 for selecionada
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
    ;
  }
}
