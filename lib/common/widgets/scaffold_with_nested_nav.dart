import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:online_groceries/config/theme/app_colors.dart';
import 'package:online_groceries/gen/assets.gen.dart';

class ScaffoldWithNestedNav extends StatefulWidget {
  const ScaffoldWithNestedNav({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey('ScaffoldWithNestedNav'));
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNav> createState() => _ScaffoldWithNestedNavState();
}

class _BottomNavItem {
  final String label;
  final String iconPath;

  const _BottomNavItem({required this.label, required this.iconPath});
}

class _ScaffoldWithNestedNavState extends State<ScaffoldWithNestedNav> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  static final List<_BottomNavItem> _bottomNavItems = [
    _BottomNavItem(label: "Shop", iconPath: Assets.images.svg.shop.path),
    _BottomNavItem(label: "Explore", iconPath: Assets.images.svg.explore.path),
    _BottomNavItem(label: "Cart", iconPath: Assets.images.svg.cart.path),
    _BottomNavItem(label: "Favorite", iconPath: Assets.images.svg.favorite.path),
    _BottomNavItem(label: "Account", iconPath: Assets.images.svg.account.path),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _goBranch,
        items: List<BottomNavigationBarItem>.generate(_bottomNavItems.length, (index) {
          final item = _bottomNavItems[index];
          return BottomNavigationBarItem(
            label: item.label,
            icon: SvgPicture.asset(
              item.iconPath,
              colorFilter: ColorFilter.mode(
                index == widget.navigationShell.currentIndex
                    ? AppColors.primaryColor
                    : AppColors.onSurface,
                BlendMode.srcIn,
              ),
            ),
          );
        }),
      ),
    );
  }
}
