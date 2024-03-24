import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

import 'package:mylib/mylib.dart';
import '../../domain/profile.dart';
import '../navigation.dart';
import '../page.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/signup_page.dart';
import '../pages/component.dart';
import '../pages/splash_page.dart';
import '../viewmodel/auth/auth_controller.dart';
import 'navbar_state.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'Users');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'Commute');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'Saved');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'Settings');
final _shellNavigatorFKey = GlobalKey<ConsumerState>(debugLabel: 'Settings2');

WidgetRef? _gRef;

@riverpod
GoRouter router(RouterRef ref) {
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());

  // don't forget to clean after yourselves (:
  ref.onDispose(isAuth.dispose);

  // update the listenable, when some provider value changes
  // here, we are just interested in wheter the user's logged in
  ref.listen(
    authControllerProvider.select((value) => value.whenData((value) => value.isAuth)),
    (_, next) {
      isAuth.value = next;
    },
  );

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    refreshListenable: isAuth,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) {
          return const LogInPage();
        },
        routes: [
          GoRoute(
            name: 'signup',
            path: 'signup',
            builder: (context, state) {
              return const SignUpPage();
            },
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                name: 'home',
                path: '/',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              GoRoute(
                name: 'users',
                path: '/users',
                builder: (context, state) => Consumer(
                  builder: (context, ref, child) {
                    _gRef = ref;
                    return child!;
                  },
                  child: const UsersPage(),
                ),
                routes: [
                  GoRoute(
                    name: 'detail',
                    path: 'detail',
                    builder: (context, state) {
                      /// detail 화면은 fullscreen이다. --> bottombar를 숨기자.
                      Future(() => _gRef
                          ?.read(navbarState.notifier)
                          .update((state) => state.copyWith(visible: false)));

                      return ProfileDetail(state.extra as Profile);
                    },
                    onExit: (context) {
                      /// 화면을 나오면 bottombar 복귀
                      _gRef
                          ?.read(navbarState.notifier)
                          .update((state) => state.copyWith(visible: true));
                      return true;
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCKey,
            routes: [
              GoRoute(
                name: 'commute',
                path: '/commute',
                builder: (context, state) => const CommutePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDKey,
            routes: [
              GoRoute(
                name: 'saved',
                path: '/saved',
                builder: (context, state) => const SavedPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorEKey,
            routes: [
              GoRoute(
                name: 'settings',
                path: '/settings',
                builder: (context, state) => Consumer(
                  key: _shellNavigatorFKey,
                  builder: (context, ref, child) {
                    _gRef = ref;

                    return child!;
                  },
                  child: const SettingsPage(),
                ),
                onExit: (context) {
                  _gRef
                      ?.read(navbarState.notifier)
                      .update((state) => state.copyWith(visible: true));
                  return true;
                },
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      print('auth: ${isAuth.value}, state: ${state.uri.path}');

      if (isAuth.value.unwrapPrevious().hasError) {
        return LogInPage.location;
      }
      if (isAuth.value.isLoading || !isAuth.value.hasValue) {
        return SplashPage.location;
      }

      final auth = isAuth.value.requireValue;

      final isSplash = (state.uri.path == SplashPage.location);
      
      if (isSplash) {
        return auth ? HomePage.location : LogInPage.location;
      }

      final isLoggingIn = (state.uri.path == LogInPage.location);
      if (isLoggingIn) return auth ? HomePage.location : null;

      final isSignin = (state.uri.path == SignUpPage.location);
      if (isSignin) return SignUpPage.location;

      return auth ? null : SplashPage.location;
    },
  );

  ref.onDispose(router.dispose); // always clean up after yourselves (:

  return router;
}
