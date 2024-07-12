import 'package:addapp/components/bottom_navbar.dart';
import 'package:addapp/models/cart.dart';
import 'package:addapp/pages/cart_page.dart';
import 'package:addapp/pages/shop_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

//intgr to controle the bottom bar
  int _selectedIndex = 0;

// method to update out selected intgr
// when the user taps on the bottombar

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// pages to display
  final List<Widget> _pages = [
//shop page
    const ShopPage(),

//cart page
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cart(),
        builder: (context, child) => Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Builder(builder: (context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ));
                }),
              ),
              bottomNavigationBar: MybottomNavBar(
                onTabChange: (index) => navigateBottomBar(index),
              ),
              drawer: Drawer(
                backgroundColor: Colors.grey[900],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        DrawerHeader(
                          decoration: BoxDecoration(
                            color: Colors
                                .grey[900], // Ensure background is consistent
                          ),
                          child: Image.asset(
                            'lib/images/puma.png',
                            width: 190,
                            color: Colors.white60,
                            fit: BoxFit.contain,
                            // Ensure it fits the container without extra space
                          ),
                        ),
                        // Other drawer items

                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.home,
                              color: Colors.white60,
                            ),
                            title: Text(
                              'Home',
                              style: TextStyle(color: Colors.white60),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.info,
                              color: Colors.white60,
                            ),
                            title: Text(
                              'About us',
                              style: TextStyle(color: Colors.white60),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.logout_rounded,
                          color: Colors.white60,
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white60),
                        ),
                        onTap: signUserOut,
                      ),
                    ),
                  ],
                ),
              ),
              body: _pages[_selectedIndex],
            ));
  }
}
