import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinergia_app/provider/provider.dart';
import 'package:sinergia_app/screens/screens.dart';
import 'package:sinergia_app/widgets/widgets.dart';

/// El HomeScreen renderiza dos widgets PageHome y UserConfig, pagehome
/// renderiza un pageview el cual muestra las dos pantallas, la pageHome y la
// vista de usuario (user_config)
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: CustomNavigarionBar(), body: _pages());
  }
}

class _pages extends StatelessWidget {
  const _pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<MenuHomeProvider>(context);

    return PageView(
      controller: navigation.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [PageHome(), UserConfig()],
    );
  }
}
