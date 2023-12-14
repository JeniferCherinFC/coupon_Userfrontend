import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_frontend/constants/colors.dart';
import 'package:user_frontend/pages/changepassword.dart';
import 'package:user_frontend/pages/couponsavail.dart';
import 'package:user_frontend/pages/couponsused.dart';
import 'package:user_frontend/pages/editprofile.dart';
import 'package:user_frontend/pages/home.dart';
import 'package:user_frontend/pages/login.dart';
import 'package:user_frontend/pages/profilesetting.dart';
import 'package:user_frontend/pages/subscriptions.dart';
import 'package:user_frontend/pages/terms_conditions.dart';


// // private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();

class RoutePaths {
  // sign in
  static const String root = '/';
// // end of signin process

  static const String home = 'Home';

  static const String availableCoupon = 'availableCoupon';
  static const String usedCoupon = 'usedCoupon';

  static const String subscription = 'subscription';
  static const String profileSetting = 'profileSetting';
  static const String editProfile = 'editProfile';
  static const String termsConditions = 'termsConditions';
  static const String changePassword = 'changePassword';
}

final goRouter = GoRouter(
    initialLocation: RoutePaths.root,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: RoutePaths.root,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SignIn()),
      ),

// ............................///bottom_navigationbar..//...................................
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return GorouteBottomNav(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutePaths.home,
                path: '/Home',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Home(),
                ),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutePaths.availableCoupon,
                path: '/availableCoupon',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: CouponsAvailable()),
                routes: [
                  GoRoute(
                      name: RoutePaths.usedCoupon,
                      path: 'usedCoupon',
                      builder: (context, state) => const CouponsUsed()),
                ],
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutePaths.subscription,
                path: '/subscription',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: Subscriptions()),
                routes: const [],
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: RoutePaths.profileSetting,
                path: '/profileSetting',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfileSetting()),
                routes: [
                  GoRoute(
                      name: RoutePaths.editProfile,
                      path: 'editProfile',
                      builder: (context, state) => const Editprofile()),
                  GoRoute(
                      name: RoutePaths.termsConditions,
                      path: 'termsConditions',
                      builder: (context, state) => const TermsConditions()),
                  GoRoute(
                      name: RoutePaths.changePassword,
                      path: 'changePassword',
                      builder: (context, state) => const ChangePWD()),
                ],
              )
            ])
          ]),
    ]);

// bottom bar classs

// ignore: must_be_immutable
class GorouteBottomNav extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  GorouteBottomNav({super.key, required this.navigationShell});

  navigateIndex(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  List<BottomNavigationBarItem> barItem = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 19), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.qr_code_2, size: 19), label: 'Coupons'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.bookmark_outline, size: 19), label: 'Subscription'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person, size: 19), label: 'profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItem,
        backgroundColor: greens,
        currentIndex: navigationShell.currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: navigateIndex,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
