import 'package:flutter/material.dart';
import 'package:task/common/extensions/num.dart';
import 'package:task/util/resource/r.dart';

OverlayEntry? _overlayEntry;

void loading(BuildContext context) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => Container(
      color: R.colors.whiteFFFFFF.withValues(alpha: 0.5),
      child: Center(
        child: CircularProgressIndicator(
          color: R.colors.primary3EB9BB,
        ),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void loadingWithText(BuildContext context, String text) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => Container(
      color: R.colors.whiteFFFFFF.withValues(alpha: 0.5),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: R.colors.primary3EB9BB,
              ),
              12.hb,
              Text(text)
            ],
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void dismissLoading() {
  if (_overlayEntry == null) return;
  _overlayEntry?.remove();
  _overlayEntry = null;
}
