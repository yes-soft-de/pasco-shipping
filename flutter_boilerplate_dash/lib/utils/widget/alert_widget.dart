import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';

class AlertWidget{

static  showAlert(BuildContext? context , bool success , String message){
    return CoolAlert.show(
        context: context!,
        width: 150,
        type:success ?CoolAlertType.success :CoolAlertType.error,
        title:success ? S.of(context).success : S.of(context).errorHappened,
        confirmBtnText:S.of(context).ok,
        backgroundColor:AppThemeDataService.PrimaryColor,
        text: message
    );
  }



}
