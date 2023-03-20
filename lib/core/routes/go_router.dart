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
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider.value(
              value: sl<EmployeeBloc>(),
              child: CreateOrEditEmployeeScreen("Register", toastString: (state.extra as String),),
            );
          },
        ),
        GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return
                MultiBlocProvider(providers: [
                  BlocProvider.value(
                      value: sl<EmployeeBloc>()),
                  BlocProvider.value(value: sl<LocationCubit>()),
                  BlocProvider.value(value: sl<InternetConnectionCubit>()),
                ], child: const HomeScreen());

            },
            routes: <RouteBase>[
              GoRoute(
                  path: 'add_employee',
                  builder: (BuildContext context, GoRouterState state) {
                    return BlocProvider.value(
                      value: sl<EmployeeBloc>(),
                      child: const CreateOrEditEmployeeScreen("Add Employee"),
                    );
                  }),
              GoRoute(
                  path: 'edit_employee',
                  name: editEmployee,
                  builder: (BuildContext context, GoRouterState state) {
                    return BlocProvider.value(
                      value: sl<EmployeeBloc>(),
                      child: CreateOrEditEmployeeScreen("Edit Employee",id: (state.extra as int)),
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
