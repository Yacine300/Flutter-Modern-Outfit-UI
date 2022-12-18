import 'package:flutter/cupertino.dart';

class IntroAndDate extends StatelessWidget {
  const IntroAndDate();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today Selection',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            "13-12-2022",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
