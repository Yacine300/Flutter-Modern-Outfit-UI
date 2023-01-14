import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four/Composant/enum.dart';
import 'package:four/Screens/AddItem/add_item_screen.dart';
import 'package:four/Screens/Cart/Cart.dart';

import 'component/BrowseBody.dart';

class Browse extends StatelessWidget {
  static String routeName = "/Browse";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: browseAppbar(context),
      body: BrowseBody(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }

  AppBar browseAppbar(BuildContext ctx) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[50],
      leading: BackButton(
        color: Colors.black87,
      ),
      actions: [
        IconButton(
            onPressed: () => Navigator.pushNamed(ctx, AddItem.routeName),
            icon: Icon(
              Icons.add,
              color: Colors.black87,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.black87,
            )),
      ],
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final MenuState selectedMenu;

  CustomBottomNavBar({this.selectedMenu});

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: MenuState.home == selectedMenu
                        ? Colors.grey.withOpacity(0.2)
                        : null,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: MenuState.home == selectedMenu
                        ? Colors.black87
                        : inActiveIconColor,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: MenuState.licked == selectedMenu
                        ? Colors.grey.withOpacity(0.2)
                        : null,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/galb.svg",
                    color: MenuState.licked == selectedMenu
                        ? Colors.black87
                        : inActiveIconColor,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: MenuState.shop == selectedMenu
                        ? Colors.grey.withOpacity(0.2)
                        : null,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    color: MenuState.shop == selectedMenu
                        ? Colors.black87
                        : inActiveIconColor,
                  ),
                  onPressed: () => Navigator.pushNamed(context, Cart.routeName),
                ),
              ),
            ],
          )),
    );
  }
}
