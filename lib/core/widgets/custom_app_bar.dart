import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/styles.dart';

AppBar buildAppBar({String? title}) {
  return AppBar(
    leading: Center(child: SvgPicture.asset("assets/images/arrow.svg")),
    title: Text(
      title ?? '',
      style: Styles.style25,
    ),
    centerTitle: true,
  );
}
