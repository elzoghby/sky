import 'package:flutter/material.dart';

TextStyle titleStyle = const TextStyle(
    fontWeight: FontWeight.w600, fontSize: 18, color: Colors.tealAccent);
TextStyle infoStyle = const TextStyle(
    fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white);

Widget additionalInfo(
    String wind, String humanity, String pressure, String feeling) {
  return Container(
    padding: const EdgeInsets.all(18),
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Additional Info',
          style: TextStyle(
            fontSize: 24,
            color: Colors.tealAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wind',
                  style: titleStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Pressure',
                  style: titleStyle,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wind,
                  style: infoStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  pressure,
                  style: infoStyle,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Humanity',
                  style: titleStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'feeling',
                  style: titleStyle,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  humanity,
                  style: infoStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  feeling,
                  style: infoStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
