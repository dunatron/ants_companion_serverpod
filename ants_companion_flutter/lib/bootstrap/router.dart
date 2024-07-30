import 'package:ants_companion_flutter/ui/admin/admin_screen.dart';
import 'package:ants_companion_flutter/ui/ads_test_screen.dart';
import 'package:ants_companion_flutter/ui/ca_details/ca_details_screen.dart';
import 'package:ants_companion_flutter/ui/ca_scheduler/ca_scheduler_screen.dart';
import 'package:ants_companion_flutter/ui/create_ant/create_ant_screen.dart';
import 'package:ants_companion_flutter/ui/create_tier_tag/create_tier_tag_screen.dart';
import 'package:ants_companion_flutter/ui/home/home_screen.dart';
import 'package:ants_companion_flutter/ui/onboarding/onboarding_screen.dart';
import 'package:ants_companion_flutter/ui/pending_notifications/pending_notifications_screen.dart';
import 'package:ants_companion_flutter/ui/route_not_found/route_not_found_screen.dart';
import 'package:ants_companion_flutter/ui/soldier_details/soldier_details_comparison_screen.dart';
import 'package:ants_companion_flutter/ui/tier_ratings/tier_ratings_screen.dart';
import 'package:ants_companion_flutter/ui/update_ant/update_ant_screen.dart';
import 'package:flutter/material.dart';
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
    // builder: (BuildContext context, GoRouterState state) => HomeScreen(),
    builder: (BuildContext context, GoRouterState state) =>
        SoldierDetailsComparisonScreen(),
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
        path: 'ca-scheduler',
        builder: (BuildContext context, GoRouterState state) =>
            const CASchedulerScreen(),
        routes: [
          GoRoute(
            path: ':caKey',
            builder: (BuildContext context, GoRouterState state) =>
                ColonyActionDetailsScreen(
              caKey: state.pathParameters['caKey']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: 'ads-test',
        builder: (BuildContext context, GoRouterState state) => AdsTestScreen(),
      ),
      GoRoute(
        path: 'pending-notifications',
        builder: (BuildContext context, GoRouterState state) =>
            const PendingNotificationsScreen(),
      ),
      GoRoute(
        path: 'soldier-details-comparison',
        builder: (BuildContext context, GoRouterState state) =>
            const SoldierDetailsComparisonScreen(),
      ),
      GoRoute(
        path: 'tier-ratings',
        builder: (BuildContext context, GoRouterState state) =>
            const TierRatingsScreen(),
        routes: [
          // antDetailsRoute(),
        ],
      ),
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
