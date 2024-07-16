import 'package:ants_companion_flutter/ui/admin/admin_screen.dart';
import 'package:ants_companion_flutter/ui/create_ant/create_ant_screen.dart';
import 'package:ants_companion_flutter/ui/create_tier_tag/create_tier_tag_screen.dart';
import 'package:ants_companion_flutter/ui/home/home_screen.dart';
import 'package:ants_companion_flutter/ui/onboarding/onboarding_screen.dart';
import 'package:ants_companion_flutter/ui/route_not_found/route_not_found_screen.dart';
import 'package:ants_companion_flutter/ui/tier_ratings/tier_ratings_screen.dart';
import 'package:ants_companion_flutter/ui/update_ant/update_ant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter routerConfig() => GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      errorBuilder: (context, state) => RouteNotFoundScreen(
        routePath: state.fullPath ?? 'fff',
      ),
      routes: routes,
    );

final routes = <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) => HomeScreen(),
    // builder: (BuildContext context, GoRouterState state) =>
    //     const PveTierPage(),
    routes: [
      GoRoute(
        path: 'admin',
        builder: (BuildContext context, GoRouterState state) =>
            const AdminScreen(),
        routes: [
          GoRoute(
            path: 'create-ant',
            builder: (BuildContext context, GoRouterState state) =>
                const CreateAntScreen(),
          ),
          GoRoute(
            path: 'update-ant/:antId',
            builder: (BuildContext context, GoRouterState state) {
              print('INTERESTING');
              final antId = state.pathParameters['antId'];
              return UpdateAntScreen(antId: antId!);
            },
          ),
          GoRoute(
            path: 'create-tier-tag',
            builder: (BuildContext context, GoRouterState state) =>
                const CreateTierTagScreen(),
          )
        ],
      ),
      GoRoute(
        path: 'onboarding',
        builder: (BuildContext context, GoRouterState state) =>
            const OnBoardingScreen(),
      ),

      GoRoute(
        path: 'tier-ratings',
        builder: (BuildContext context, GoRouterState state) =>
            const TierRatingsScreen(),
        routes: [
          // antDetailsRoute(),
        ],
      ),
      // antDetailsRoute(),
      // GoRoute(
      //   path: 'ants-list',
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const AntsListPage(),
      //   routes: [
      //     antDetailsRoute(),
      //   ],
      // ),
      // GoRoute(
      //   path: 'pve-tier-list',
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const PveTierPage(),
      // ),
      // GoRoute(
      //   path: 'battle-simulator',
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const BattleSimulatorPage(),
      // ),
      // GoRoute(
      //   path: 'hatch-recorder',
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const HatchRecorderPage(),
      // ),
      // GoRoute(
      //   path: 'csv-manager',
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const CsvManagerScreen(),
      // ),
    ],
  ),
];

// antDetailsRoute() => GoRoute(
//       path: 'ant/:id',
//       builder: (BuildContext context, GoRouterState state) {
//         final String? antId = state.pathParameters['id'];

//         if (antId == null) {
//           throw Error();
//         }
//         final Ants ants = GetIt.I<Ants>();

//         final ant = ants.antById(antId);

//         if (ant == null) {
//           throw Error();
//         }

//         return AntDetailsPage(ant: ant);
//       },
//     );
