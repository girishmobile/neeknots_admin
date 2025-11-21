import 'package:flutter/material.dart';

const color1 = Color.fromRGBO(222, 239, 227, 1);
const color2 = Color.fromRGBO(168, 223, 245, 1);
const color3 = Color.fromRGBO(203, 168, 255, 1);

const btnColor1 = Color.fromRGBO(93, 161, 251, 1);
const btnColor2 = Color.fromRGBO(153, 45, 254, 1);

// const btnColor1 = Color(0xFFFFC371); // extra-light orange (top)
// const btnColor2 = Color(0xFFFF9A3D); // slightly darker orange (bottom)

const colormint = Color(0xFFDFF5E1);
const colorcyan = Color(0xFFB9E5F2);
const colorpurple = Color(0xFFCDB8F2);
const colororange = Color(0xFFFFE0B3);
const coloryellow = Color(0xFFFFF3B0);
const colorgreen = Color(0xFFDAF5D4);
const colorred = Color(0xFFFFC1C1);
const colorblue = Color(0xFFB3D9FF);

LinearGradient orangeOptionA() {
  return const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFF3E8),
      Color(0xFFFFD9B0),
      Color(0xFFFFAC55),
      Color(0xFFFF9A3D),
    ],
    stops: [0.0, 0.5, 0.75, 1.0],
  );
}

LinearGradient orangeOptionB() {
  return const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFF0DD), Color(0xFFFFCC8A), Color(0xFFFF9833)],
    stops: [0.0, 0.5, 1.0],
  );
}
