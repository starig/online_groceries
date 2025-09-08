import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNav extends StatefulWidget {
  const ScaffoldWithNestedNav({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey('ScaffoldWithNestedNav'));
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNav> createState() => _ScaffoldWithNestedNavState();
}

class _ScaffoldWithNestedNavState extends State<ScaffoldWithNestedNav> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _goBranch,
        items: [
          BottomNavigationBarItem(label: "Shop", icon: Icon(Icons.shop)),
          BottomNavigationBarItem(label: "Cart", icon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(label: "Favorite", icon: Icon(Icons.favorite_border)),
        ],
      ),
    );
  }
}
