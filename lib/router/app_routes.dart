import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  //Un metodo o propiedad estatica que se puede acceder sin necesidad de instanciar la clase, es decir ponerlo de manera global
  static const initialRoute = 'inteligencia';

  static Map<String, Widget Function(BuildContext)> routes = {
    'introduction': (BuildContext context) => const IntroductionScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'register': (BuildContext context) => const RegisterScreen(),
    'home': (BuildContext context) => const HomeScreen(),
    'inteligencia': (BuildContext context) =>
        const InteligenciaEmocinalScreen(),
    'charlaa': (BuildContext context) => const CharlasScreen(),
    'emi': (BuildContext context) => const HablaConEmiScreen(),
    'ParaTi': (BuildContext context) => const ParaTiScreen(),
    'blogIra': (BuildContext context) => const BlogManejoIraScreen(),
    'blogMiedo': (BuildContext context) => const BlogManejoMiedoScreen(),
    'blogRetos': (BuildContext context) => const BlogRetosScreen(),
    'blogInteligencia': (BuildContext context) =>
        const BlogInteligenciaEmocionalScreen(),
    'item_blog': (BuildContext context) => const ItemBlogScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: ((context) => const HomeScreen()));
  }
}
