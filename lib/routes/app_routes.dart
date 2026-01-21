import 'package:go_router/go_router.dart';
import 'package:weather_bloc/presentation/screens/home_screen.dart';
import 'package:weather_bloc/routes/app_routes_const.dart';

class AppRoutes {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutesConst.homeConst,
        builder: (context, state) {
          return HomeScreen();
        },
      ),
    ],
  );
}
