part of '../../main.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider.value(
            value: sl<EmployeeBloc>(), child: const SplashScreen());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider.value(
                  value: sl<EmployeeBloc>(), child: const HomeScreen());
            },
            routes: <RouteBase>[
              GoRoute(
                  path: 'add_employee',
                  builder: (BuildContext context, GoRouterState state) {
                    return BlocProvider.value(
                      value: sl<EmployeeBloc>(),
                      child: const CreateOrEditEmployeeScreen(),
                    );
                  }),
              GoRoute(
                  path: 'edit_employee',
                  name: editEmployee,
                  builder: (BuildContext context, GoRouterState state) {
                    return BlocProvider.value(
                      value: sl<EmployeeBloc>(),
                      child: CreateOrEditEmployeeScreen(id: (state.extra as int)),
                    );
                  }),
            ]),
        GoRoute(
          path: 'detail',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider.value(
                value: sl<EmployeeBloc>(), child: const DetailScreen());
          },
        ),
      ],
    ),
  ],
);
