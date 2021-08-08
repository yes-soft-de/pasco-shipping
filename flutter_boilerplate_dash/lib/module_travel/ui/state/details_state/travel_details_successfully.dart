import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/module_travel/enums/travel_status.dart';
import 'package:pasco_shipping/module_travel/request/travel_change_state_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_details_response.dart';
import 'package:pasco_shipping/module_travel/widget/status_card.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/widget/roundedButton.dart';

class TravelDetailsSuccessfully extends StatelessWidget {
  final TravelDetailsModel model;
  final Function onChangeStatus;
  const TravelDetailsSuccessfully(this.model, this.onChangeStatus);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstCard(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Travel Information' , style: AppTextStyle.largeBlueBold,),
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
                      Text('Launch Country'),
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
                      Text('launchDate'),
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
                      Text('Destination Country'),
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
                      Text('Arrival Date'),
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
                      Text('Subcontract Name'),
                      Text(model.subcontractName ?? ''),
                    ],
                  ),
                ),
            ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Container Information' , style: AppTextStyle.largeBlueBold,),
          ),
          model.holders!.isEmpty?
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No holder has been added to this trip',style: AppTextStyle.mediumRed,),
              ):
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context , index){
            return holderCard(model.holders![index]);
          },
            itemCount: model.holders!.length,

          ),
          statusCard()

        ],
      ),
    );
  }

  Widget firstCard(){
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
                Text('the Trip waiting ' ,style: AppTextStyle.largeBlack,)
              ],),
            ) ,
            Text("This trip hasn't started yet" , style: AppTextStyle.mediumBlack,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:

              [
                Text("Travel Number: " , style: AppTextStyle.mediumBlackBold,),
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
                      Text('the Trip started ' ,style: AppTextStyle.largeBlack,)
                    ],),
                ) ,
                Text('This trip has started at ' + model.launchDate.toString().split('.').first , style: AppTextStyle.mediumBlack,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      Text("Travel Number: " , style: AppTextStyle.mediumBlackBold,),
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
                      Text('the Trip released ' ,style: AppTextStyle.largeBlack,)
                    ],),
                ) ,
                Text("This trip has arravied at " + model.arrivalDate.toString().split('.').first , style: AppTextStyle.mediumBlack,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:

                    [
                      Text("Travel Number: " , style: AppTextStyle.mediumBlackBold,),
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

  Widget holderCard(HolderModel holderModel){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Track Number: ' , style: AppTextStyle.mediumBlack,),
                  Text(holderModel.trackNumber?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Container Number: ' , style: AppTextStyle.mediumBlack,),
                  Text(holderModel.the0!.containerNumber ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Status: ' , style: AppTextStyle.mediumBlack,),
                  Text(holderModel.the0!.status ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Type: ' , style: AppTextStyle.mediumBlack,),
                  Text(holderModel.the0!.type ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text('Subcontract Name: ' , style: AppTextStyle.mediumBlack,),
                  Text(holderModel.the0!.subcontractName ?? '' , style: AppTextStyle.mediumBlueBold,),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Consignee Name: ' , style: AppTextStyle.mediumBlack,),
                        Text(holderModel.the0!.consigneeName ?? '' , style: AppTextStyle.mediumBlueBold,),
                      ],
                    ),


                    Row(children: [
                      Text('shipper Name: ' , style: AppTextStyle.mediumBlack,),
                      Text(holderModel.the0!.shipperName ?? '' , style: AppTextStyle.mediumBlueBold,),
                    ],)

                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statusCard(){
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
              child: Text('Travel Status' , style: AppTextStyle.largeBlueBold,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              StatusCard('Current' ,isCurrent),
              Icon(Icons.arrow_forward_outlined , color: Colors.grey,),
              StatusCard('Started' ,!isCurrent),
                Icon(Icons.arrow_forward_outlined ,color: Colors.grey,),
              StatusCard('Released' , false),
            ],),
            RoundedButton(lable: 'Next Status', icon: '', color: AppThemeDataService.AccentColor, style: AppTextStyle.mediumWhite, go: (){
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
