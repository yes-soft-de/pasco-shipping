import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
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
              (model.image ==null || model.image!.isEmpty ) ? Image.asset(StaticImage.profile , width: 100,height: 100,): Image.network(model.image!,width: 100,height: 100,),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          S.of(context).emailOrPhone+': ',
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
                          S.of(context).name,
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
                          S.of(context).country+': ',
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
                          S.of(context).city+': ',
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
                          S.of(context).address+': ',
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
                    Text(S.of(context).marks+': ' , style: AppTextStyle.mediumBlueBold,),
                    ListView.builder(itemBuilder:(context,index){
                      return Text(model.marks![index].markNumber!+',' , style: AppTextStyle.mediumDeepGrayBold,);
                    },itemCount: model.marks!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                    ),
                    SizedBox(height: 20,),



                    Row(
                      children: [
                        Text(
                          S.of(context).createdBy,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child: Text(
                          model.createdByUser ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),
                    Row(
                      children: [
                        Text(
                          S.of(context).createdAt,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child: Text(
                          model.createdAt.toString().split('.').first,
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),

                   model.updatedByUser !=null ? Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              S.of(context).updatedBy,
                              style: AppTextStyle.mediumBlack,
                            ),
                            Expanded(child: Text(
                              model.updatedByUser ?? '',
                              style: AppTextStyle.mediumBlueBold,
                            ),
                            )],
                        ),
                        Row(
                          children: [
                            Text(
                              S.of(context).updatedAt,
                              style: AppTextStyle.mediumBlack,
                            ),
                            Expanded(child: Text(
                              model.createdAt.toString().split('.').first,
                              style: AppTextStyle.mediumBlueBold,
                            ),
                            )],
                        ),
                      ],
                    ):Container(),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        onDelete(model.id);
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              S.of(context).delete,
                              style: AppTextStyle.mediumWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        onEdit(model);
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              S.of(context).edit,
                              style: AppTextStyle.mediumWhite,
                            ),
                          ],
                        ),
                      ),
                    ),

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
