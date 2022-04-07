import 'package:flutter/material.dart';

Widget weatherData(String condition, String temp, String location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(condition,style: TextStyle(fontSize: 40,color: Colors.white),),
        const SizedBox(
          height: 10,
        ),
        Text(
          temp,
          style: const TextStyle(fontSize: 46,color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          location,
          style: const TextStyle(fontSize: 18, color: Colors.white70 , fontWeight: FontWeight.w600),
        ),


      ],
    ),
  );
}
