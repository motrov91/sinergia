import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  //Un metodo o propiedad estatica que se puede acceder sin necesidad de instanciar la clase, es decir ponerlo de manera global
  static const initialRoute = 'introduction';

  static Map<String, Widget Function(BuildContext)> routes = {
    'introduction': (BuildContext context) => const IntroductionScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'register': (BuildContext context) => const RegisterScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: ((context) => const HomeScreen()));
  }
}
