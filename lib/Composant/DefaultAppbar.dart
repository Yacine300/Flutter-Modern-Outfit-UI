import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SizeConfiguration.dart';

class DefaultAppbar extends PreferredSize {
  final String title;
  const DefaultAppbar({@required this.title});
   Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[50],
      leading: const BackButton(
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'GFSDidot',
          color: Colors.black87,
          fontWeight: FontWeight.w200,
        ),
      ),
      titleSpacing: SizeConfiguration.defaultSize,
    );
  }
}
