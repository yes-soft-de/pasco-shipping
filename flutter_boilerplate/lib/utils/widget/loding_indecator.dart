import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';

class LoadingIndicator extends StatelessWidget {
  final Color _color;
  const LoadingIndicator(this._color);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(_color),
    );
  }
}
