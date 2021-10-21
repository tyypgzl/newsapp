import 'package:flutter/material.dart';
import 'package:newsapp/core/components/constants/text_const.dart';
import 'package:newsapp/core/theme/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            TextConst.appBar1,
            style: TextStyle(color: AppColor.erieBlack2, fontSize: 22),
          ),
          Text(
            TextConst.appBar2,
            style: TextStyle(color: AppColor.imperialRed, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
