import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class ContainerPriceCard extends StatelessWidget {
  final ContainerPrice model;
  const ContainerPriceCard({Key? key ,required this.model}) : super(key: key);

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
                          S.of(context).name,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child: Text(
                          model.name ?? '',
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
                          S.of(context).prices+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:Text(
                          model.price ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),
                    SizedBox(
                      height: 10,
                    ),


                  ],
                ),
              ),
              SizedBox(width: 10,),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        // widget.onDelete(widget.model.id);
                      },
                      child: Text(
                        S.of(context).delete,
                        style: AppTextStyle.mediumWhite,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        // widget.onEdit(widget.model);
                      },
                      child: Text(
                        S.of(context).edit,
                        style: AppTextStyle.mediumWhite,
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
