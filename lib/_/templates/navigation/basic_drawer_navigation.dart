//#TEMPLATE nav_basic_drawer
import 'package:flutter/material.dart';

class BasicDrawerMainNavigationView extends StatefulWidget {
  const BasicDrawerMainNavigationView({Key? key}) : super(key: key);

  @override
  State<BasicDrawerMainNavigationView> createState() =>
      _BasicDrawerMainNavigationViewState();
}

class _BasicDrawerMainNavigationViewState
    extends State<BasicDrawerMainNavigationView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: selectedIndex,
      child: Scaffold(
        appBar: selectedIndex != 0
            ? null
            : AppBar(
                backgroundColor: Colors.blueGrey,
                title: const Text("Home"),
              ),
        body: IndexedStack(
          index: selectedIndex,
          children: [
            Container(
              color: Colors.green[100],
            ),
            Container(
              color: Colors.red[100],
            ),
            Container(
              color: Colors.purple[100],
            ),
            Container(
              color: Colors.blue[100],
            ),
          ],
        ),
        drawer: selectedIndex != 0
            ? null
            : Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                      ),
                      child: Text(
                        'Drawer Header',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('Item 1'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Item 2'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.grey[700],
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Order",
              icon: Icon(
                Icons.list,
              ),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(
                Icons.favorite,
              ),
            ),
            BottomNavigationBarItem(
              label: "Me",
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//#END