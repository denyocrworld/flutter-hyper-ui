import 'dart:math' as math;
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String name;
  final String subname;
  final String icon;
  final Color color;
  const ProfileItem({
    required this.name,
    required this.subname,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(6.0),
            child: Row(
              children: [
                Container(
                    height: 28,
                    width: 28,
                    padding: EdgeInsets.all(5.5),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(icon)),
                SizedBox(width: 16),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Spacer(),
                Text(
                  subname,
                  style: TextStyle(
                    color: Color(0xff3C3C43).withOpacity(0.6),
                    fontSize: 17,
                  ),
                ),
                SizedBox(width: 6),
                Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 14,
                    color: Color(0xffD1D1D6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
