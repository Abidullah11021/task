import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/util/resource/r.dart';

void showToast({required String msg, Color? color}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: R.colors.whiteFFFFFF,
    backgroundColor: color ?? R.colors.redFF0000,
  );
}
