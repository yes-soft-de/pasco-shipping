import 'package:flutter/material.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pasco_shipping/utils/styles/static_images.dart';

class ClientCard extends StatelessWidget {
  final ClientModel model;
  final Function onDelete;
  final Function onEdit;

   ClientCard({required this.model,required this.onEdit , required this.onDelete});

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
            children: [
              model.image ==null ? Image.asset(StaticImage.profile , width: 100,height: 100,): Image.network(model.image!,width: 100,height: 100,),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'UserID: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child: Text(
                          model.userID ?? '',
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
                          'Full name ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child: Text(
                          model.userName ?? '',
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
                          'Country: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:Text(
                          model.country?? '',
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
                          'City: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                            model.city ?? '',
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
                          'Address: ',
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(
                          child: Text(
                            model.location ?? '',
                            style: AppTextStyle.mediumBlueBold,
                          ),
                        )],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Marks' , style: AppTextStyle.mediumBlueBold,),
                    ListView.builder(itemBuilder:(context,index){
                      return Text(model.marks![index].markNumber!+',' , style: AppTextStyle.mediumDeepGrayBold,);
                    },itemCount: model.marks!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
