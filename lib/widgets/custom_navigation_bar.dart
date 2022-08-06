import 'package:flutter/material.dart';

class CustomNavigarionBar extends StatelessWidget {
  const CustomNavigarionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        boxShadow: [
          BoxShadow(
              color: Colors.purple.withOpacity(0.5),
              offset: const Offset(0, 2),
              blurRadius: 9)
        ],
      ),
      child: BottomNavigationBar(
          currentIndex: 0,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                activeIcon: _GradientIcon(
                  child: Icon(
                    Icons.home,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.home,
                  size: 28,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: _GradientIcon(
                  child: Icon(
                    Icons.person,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                icon: Icon(
                  Icons.person,
                  size: 28,
                ),
                label: ''),
          ]),
    );
  }
}

class _GradientIcon extends StatelessWidget {
  final Widget child;

  const _GradientIcon({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff8130EA), Color(0xffFF9A34)],
      ).createShader(bounds),
      child: child,
    );
  }
}
