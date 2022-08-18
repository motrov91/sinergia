import 'package:flutter/material.dart';
import 'package:sinergia_app/screens/screens.dart';

class BlogStructure extends StatelessWidget {
  final Color MenuOptionColorLeft;
  final Color MenuOptionColorRight;
  final Color ItemColorLeft;
  final Color ItemColorRight;

  const BlogStructure(
      {Key? key,
      required this.MenuOptionColorLeft,
      required this.MenuOptionColorRight,
      required this.ItemColorLeft,
      required this.ItemColorRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _MenuOptions(
        press: () {},
        textButton: 'prueba',
        colorLeftMenu: MenuOptionColorLeft,
        colorRightMenu: MenuOptionColorRight,
      ),
      _Itemsblog(
        colorLeftItem: ItemColorLeft,
        colorRightItem: ItemColorRight,
        shadow: ItemColorRight,
      )
    ]);
  }
}

class _Itemsblog extends StatelessWidget {
  final Color colorLeftItem;
  final Color colorRightItem;
  final Color? shadow;

  const _Itemsblog({
    Key? key,
    this.colorLeftItem = Colors.blueGrey,
    this.colorRightItem = Colors.grey,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ItemBlogScreen(
                            colorLeft: colorLeftItem,
                            colorRight: colorRightItem,
                          )))),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 120,
                decoration: StyleBox(),
                child: _CardInfo(),
              ),
            );
          }),
    );
  }

  BoxDecoration StyleBox() {
    return BoxDecoration(
        gradient: LinearGradient(colors: [colorLeftItem, colorRightItem]),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: shadow ?? Colors.black, spreadRadius: 1, blurRadius: 10)
        ]);
  }
}

class _CardInfo extends StatelessWidget {
  const _CardInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: 200,
              child: Column(children: [
                Spacer(),
                Text(
                  'Como reaccionar ante un posible ataque',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '55',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '102',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ]),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
              size: 40,
              color: Colors.white,
            )
          ],
        ),
        Row(
          children: [
            Spacer(),
            Container(
              width: 110,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white24,
                        Colors.white.withOpacity(0.01),
                      ]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
            ),
          ],
        )
      ],
    );
  }
}

class _MenuOptions extends StatelessWidget {
  Color colorLeftMenu;
  Color colorRightMenu;
  final String textButton;
  final VoidCallback press;

  _MenuOptions({
    Key? key,
    this.colorLeftMenu = Colors.blueGrey,
    this.colorRightMenu = Colors.grey,
    required this.textButton,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
              width: 140,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [colorLeftMenu, colorRightMenu]),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                'Autocontrol',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            );
          }),
    );
  }
}
