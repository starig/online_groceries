import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:online_groceries/common/widgets/scaffold_with_nested_nav.dart';
import 'package:online_groceries/features/cart/cart.dart';
import 'package:online_groceries/features/favorite/favorite.dart';
import 'package:online_groceries/features/shop/shop.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorShopKey = GlobalKey<NavigatorState>(debugLabel: 'shellShop');
final _shellNavigatorCartKey = GlobalKey<NavigatorState>(debugLabel: 'shellCart');
final _shellNavigatorFavoriteKey = GlobalKey<NavigatorState>(debugLabel: 'shellFavorite');

class AppRoutes {
  static const String shopScreen = '/shop';
  static const String exploreScreen = '/explore';
  static const String cartScreen = '/cart';
  static const String favoriteScreen = '/favorite';
  static const String accountScreen = '/account';
}

final router = GoRouter(
  initialLocation: AppRoutes.shopScreen,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNestedNav(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorShopKey,
          routes: [GoRoute(path: AppRoutes.shopScreen, builder: (context, state) => const Shop())],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCartKey,
          routes: [GoRoute(path: AppRoutes.cartScreen, builder: (context, state) => const Cart())],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFavoriteKey,
          routes: [
            GoRoute(path: AppRoutes.favoriteScreen, builder: (context, state) => const Favorite()),
          ],
        ),
      ],
    ),
  ],
);
