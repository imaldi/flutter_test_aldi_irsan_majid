part of '../../main.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider.value(
            value: sl<EmployeeBloc>(),
            child: const SplashScreen());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider.value(
                value: sl<EmployeeBloc>(),
                child: const HomeScreen());
          },
        ),
        GoRoute(
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider.value(
                value: sl<EmployeeBloc>(),
                child: const DetailScreen());
          },
        ),
      ],
    ),
  ],
);