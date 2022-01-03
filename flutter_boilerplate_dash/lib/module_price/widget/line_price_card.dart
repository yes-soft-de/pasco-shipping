import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class LinePriceCard extends StatelessWidget {
  final LinesPrice model;
  final Function onEditLines;
  const LinePriceCard({Key? key ,required this.model,required this.onEditLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          S.of(context).oneKiloPrice+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child: Text(
                          model.oneKiloPrice ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          S.of(context).oneCBMPrice+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:Text(
                        model.oneCBMPrice.toString()+' USD',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Text(
                          S.of(context).from+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                           model.exportCountryName.toString()+' - ' + model.exportCity.toString(),
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        )],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Text(
                          S.of(context).to+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                            model.importCountryName.toString()+' - ' + model.importCity.toString(),
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        )],
                    ),

                  ],
                ),
              ),
              SizedBox(width: 10,),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    onEditLines(model);
                  },
                  child: Text(
                    S.of(context).edit,
                    style: AppTextStyle.mediumWhite,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
