import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/styles/text_style.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  final Function retry;
  const ErrorScreen({required this.error, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset(StaticImage.noInternet), Text(error , style: AppTextStyle.largeBlack,)],
    );
  }
}
