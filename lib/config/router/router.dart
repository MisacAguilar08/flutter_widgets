import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';


final goRouter = GoRouter(
  initialLocation: '/',
    routes: [
        GoRoute(
            path: '/',
            name: HomeScreen.name,
            builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
            path: '/cards',
            name: CardsScreen.name,
            builder: (context, state) => CardsScreen(),
        ),
        GoRoute(
            path: '/buttons',
            name: ButtonsScreen.name,
            builder: (context, state) => ButtonsScreen(),
        )
    ],
);