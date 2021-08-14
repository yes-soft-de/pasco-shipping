import 'package:flutter/material.dart';

import 'AppFontsSize.dart';
import 'colors.dart';

abstract class AppTextStyle {
// -------------------- white



  static final largeWhiteBold = TextStyle(
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.large_font_size),
    color: white,
    fontWeight: FontWeight.bold,
  );

  static String segoePrint = 'Segoe Print';
  static String cairo = 'Cairo';
  static String segoeUI = 'Segoe UI';


  static final normalWhite = TextStyle(
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.normal_font_size),
    color: white,
  );
  static final normalWhiteBold = TextStyle(
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.normal_font_size),
    color: white,
    fontWeight: FontWeight.bold,
  );

  static final mediumWhite = TextStyle(
    color: white,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
  );

  static final mediumWhiteBold = TextStyle(
    color: white,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
    fontWeight: FontWeight.bold,
  );

  static final smallWhite = TextStyle(
    color:white,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
  );
  static final smallWhiteBold = TextStyle(
    color: white,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
    fontWeight: FontWeight.bold
  );

  static final xSmallWhite = TextStyle(
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.x_small_font_size),
    color: Colors.white,
  );

  static final xSmallWhiteBold = TextStyle(
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.x_small_font_size),
    color: Colors.white,
    fontWeight: FontWeight.bold
  );

  static final xxSmallWhiteBold = TextStyle(
    fontWeight: FontWeight.bold,
    color: white,
    fontSize: AppFontsSize.getScaledFontSize(
        AppFontsSize.xx_small_font_size),
  );




//------------------------ DeepGray
  static final smallDeepGray = TextStyle(
    color: deepGray,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
  );


  static final xSmallDeepGray = TextStyle(
    color: deepGray,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.x_small_font_size),
  );

  static final xxSmallDeepGray = TextStyle(
    color: deepGray,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.xx_small_font_size),
  );


  static final mediumDeepGrayBold = TextStyle(
    color: deepGray,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
    fontWeight: FontWeight.bold,
  );

  static final mediumDeepGray = TextStyle(
    color: deepGray,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
  );

//  ---------------------- black


  static final largeBlackBold = TextStyle(
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.large_font_size),
    color: black,
    fontWeight: FontWeight.bold,
  );

  static final largeBlack = TextStyle(
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.large_font_size),
    color: black,
  );


  static final normalBlackBold = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.normal_font_size),
    fontWeight: FontWeight.bold,
  );

  static final normalBlack = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.normal_font_size),
  );
  static final mediumBlack = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
  );

  static final mediumBlackBold = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
    fontWeight: FontWeight.bold,
  );

  static final smallBlack = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
  );
  static final smallBlackThin = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
    fontWeight: FontWeight.w500
  );
  static final smallBlackBold = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
    fontWeight: FontWeight.bold,
  );
//  static final smallBlackThin = TextStyle(
//    color: black,
//    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
//    fontWeight: FontWeight.w500,
//  );

  static final xSmallBlackBold = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.x_small_font_size),
    fontWeight: FontWeight.bold,
  );

  static final xSmallBlack = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.x_small_font_size),
  );

  static final xSmallBlackUnderLine = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.x_small_font_size),
    decoration: TextDecoration.underline
  );

  static final xxSmallBlack = TextStyle(
    color: black,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.xx_small_font_size),
  );


//------------------ red

  static final normalRedBold = TextStyle(
      color: red,
      fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.normal_font_size),
      fontWeight: FontWeight.bold
  );

  static final mediumRedBold = TextStyle(
    color: red,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
    fontWeight: FontWeight.bold
  );
  static final mediumRed = TextStyle(
    color: red,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
  );

  static final smallRed = TextStyle(
    color: red,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
  );

  static final smallRedBold = TextStyle(
    color: red,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
    fontWeight: FontWeight.bold
  );

  static final xSmallRed = TextStyle(
    color: red,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.x_small_font_size),
  );

  static final xSmallRedBold = TextStyle(
    color: red,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.x_small_font_size),
    fontWeight: FontWeight.bold
  );

  static final xxSmallRed = TextStyle(
    color: red,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.xx_small_font_size),
  );

  ////////////////////// green
  static final smallGreen = TextStyle(
    color: green,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
  );
  static final largeGreenBold = TextStyle(
    color: green,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.large_font_size),
      fontWeight: FontWeight.bold
  );
  static final xSmallGreen = TextStyle(
    color: green,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.x_small_font_size),
    fontWeight: FontWeight.bold
  );


  static final errorStyle = TextStyle(
    color: red,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.xx_small_font_size),
  );


  ////////////////////// blue


  static final smallBlue = TextStyle(
    color: blue,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
  );

  static final smallBlueBold = TextStyle(
      color: blue,
      fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.small_font_size),
      fontWeight: FontWeight.bold
  );

  static final normalBlue = TextStyle(
      color: blue,
      fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.normal_font_size),
  );
  static final normalBlueBold = TextStyle(
      color: blue,
      fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.normal_font_size),
      fontWeight: FontWeight.bold
  );

  static final mediumBlueBold = TextStyle(
      color: blue,
      fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
      fontWeight: FontWeight.bold
  );
  static final mediumBlue = TextStyle(
    color: blue,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.medium_font_size),
  );
  static final largeBlueBold = TextStyle(
      color: blue,
      fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.large_font_size),
      fontWeight: FontWeight.bold
  );
  static final largeBlue = TextStyle(
    color: blue,
    fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.large_font_size),
  );

  /// yellow
  static final normalYellowBold = TextStyle(
        color: yellow,
        fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.normal_font_size),
        fontWeight: FontWeight.bold
    );
  static final normalYellow = TextStyle(
      color: yellow,
      fontSize: AppFontsSize.getScaledFontSize(AppFontsSize.normal_font_size),
  );

  static final Shadow appShadow =  Shadow(color: black.withOpacity(0.35), blurRadius: 6 , offset: Offset(0, 6));
}
