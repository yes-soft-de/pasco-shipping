
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_change_state_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_details_response.dart';
import 'package:pasco_shipping/module_travel/widget/status_card.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class TravelDetailsSuccessfully extends StatelessWidget {
  final TravelDetailsModel model;
  final Function onChangeStatus;
  final Function onShowFinance;
  const TravelDetailsSuccessfully({required this.model,required this.onChangeStatus,required this.onShowFinance});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstCard(context),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).travelInformation , style: AppTextStyle.largeBlueBold,),
                InkWell(
                    onTap: (){
                      onShowFinance(model.id);
                    },
                    child: Column(
                      children: [
                        Image.asset(StaticImage.accounting),
                        Text(S.of(context).cost ,style: AppTextStyle.mediumBlackBold,)
                      ],
                    )),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).launchCountry),
                      Text(model.launchCountry ?? ''),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).startDate),
                      Text(model.launchDate.toString().split('.').first),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).destinationCountry),
                      Text(model.destinationCountry ?? ''),
                    ],
                  ),
                ),
                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).arrivalDate),
                      Text(model.arrivalDate.toString().split('.').first),
                    ],
                  ),
                ),

                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).subcontract),
                      Text(model.subcontractName ?? ''),
                    ],
                  ),
                ),

                Divider(color: Colors.grey[300],thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).carrier),
                      Text(model.carrierName ?? ''),
                    ],
                  ),
                ),
            ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(S.of(context).holderInfo , style: AppTextStyle.largeBlueBold,),
          ),
          model.holders!.isEmpty?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(S.of(context).noHolder,style: AppTextStyle.mediumRed,),
              ):
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context , index){
            return holderCard(model.holders![index] ,context ,model.type!);
          },
            itemCount: model.holders!.length,

          ),
          statusCard(context)

        ],
      ),
    );
  }

  Widget firstCard(BuildContext context){
    if(model.status == TravelStatusName[TravelStatus.CURRENT]) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blueGrey[100],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Icon(
                  Icons.warning,
                  color: Colors.yellow[800],
                  size: 40,
                ),
                Text(S.of(context).waitingTrip ,style: AppTextStyle.largeBlack,)
              ],),
            ) ,
            Text(S.of(context).notStartedTrip , style: AppTextStyle.mediumBlack,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:

              [
                Text(S.of(context).travelNumber+': ' , style: AppTextStyle.mediumBlackBold,),
                Text('#'+ model.travelNumber! , style: AppTextStyle.mediumBlackBold,),

              ],),
            ),
          ],),
        ),
    ),
      );
    } else if(model.status == TravelStatusName[TravelStatus.STARTED]){
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.run_circle_outlined,
                        color: Colors.blue[800],
                        size: 40,
                      ),
                      Text(S.of(context).startedTrip ,style: AppTextStyle.largeBlack,)
                    ],),
                ) ,
                Text(S.of(context).startTrip + model.launchDate.toString().split('.').first , style: AppTextStyle.mediumBlack,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      Text(S.of(context).travelNumber, style: AppTextStyle.mediumBlackBold,),
                      Text('#'+ model.travelNumber! , style: AppTextStyle.mediumBlackBold,),

                    ],),
                ),
              ],),
          ),
        ),
      );
    } else if(model.status == TravelStatusName[TravelStatus.RELEASED]){
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green[800],
                        size: 40,
                      ),
                      Text(S.of(context).releasedTrip ,style: AppTextStyle.largeBlack,)
                    ],),
                ) ,
                Text(S.of(context).arriveTrip+ model.arrivalDate.toString().split('.').first , style: AppTextStyle.mediumBlack,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:

                    [
                      Text(S.of(context).travelNumber, style: AppTextStyle.mediumBlackBold,),
                      Text('#'+ model.travelNumber! , style: AppTextStyle.mediumBlackBold,),

                    ],),
                ),
              ],),
          ),
        ),
      );
    }else {
      return Container();
    }

  }

  Widget holderCard(HolderModel holderModel ,BuildContext context ,String type){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(children: [
              //     Text('Track Number: ' , style: AppTextStyle.mediumBlack,),
              //     Text(holderModel.trackNumber?? '' , style: AppTextStyle.mediumBlueBold,),
              //   ],),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(type =='flight'? S.of(context).airwaybillNumber+': ' :S.of(context).containerNumber, style: AppTextStyle.mediumBlack,),
                  Text(holderModel.containerNumber ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(S.of(context).status+': ', style: AppTextStyle.mediumBlack,),
                  Text(holderModel.status ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(S.of(context).type+": " , style: AppTextStyle.mediumBlack,),
                  Text(holderModel.type ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(S.of(context).subcontract+': ' , style: AppTextStyle.mediumBlack,),
                  Text(holderModel.subcontractName ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(S.of(context).consignee+': ' , style: AppTextStyle.mediumBlack,),
                    Text(holderModel.consigneeName ?? '' , style: AppTextStyle.mediumBlueBold,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(S.of(context).shipper+': ', style: AppTextStyle.mediumBlack,),
                  Text(holderModel.shipperName ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget statusCard(BuildContext context){
    bool isCurrent;
    if(model.status == TravelStatusName[TravelStatus.CURRENT]){
      isCurrent = true;
    }else {
      isCurrent = false;
    }

    return  Visibility(
      visible:model.status == TravelStatusName[TravelStatus.RELEASED] ? false :true ,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(S.of(context).travelStatus , style: AppTextStyle.largeBlueBold,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              StatusCard(S.of(context).currentt ,isCurrent),
              Icon(Icons.arrow_forward_outlined , color: Colors.grey,),
              StatusCard(S.of(context).started ,!isCurrent),
                Icon(Icons.arrow_forward_outlined ,color: Colors.grey,),
              StatusCard(S.of(context).released , false),
            ],),
            RoundedButton(lable: S.of(context).nextStatus, icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
              if(isCurrent){
                if(model.holders!.isEmpty){
                  Fluttertoast.showToast(msg: 'No holder has been added to this trip');
                }else {
                  TravelChangeStateRequest re = TravelChangeStateRequest(id: model.id!.toInt() ,status: TravelStatusName[TravelStatus.STARTED]!);
                  onChangeStatus(re);
                }
              }else{
                TravelChangeStateRequest re1 = TravelChangeStateRequest(id: model.id!.toInt() ,status: TravelStatusName[TravelStatus.RELEASED]!);
                onChangeStatus(re1);
              }

            }, radius: 12)
          ],
        ),
      ),
    );
  }
}
