import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_employees/enums/employee_role.dart';
import 'package:pasco_shipping/module_employees/request/employees_request.dart';
import 'package:pasco_shipping/module_employees/response/employees_response.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:collection/collection.dart';
import 'package:pasco_shipping/utils/widget/alert_widget.dart';

class EmployeeCard extends StatefulWidget {
  final EmployeeModel model;
  final Function onDelete;
  final Function onEdit;
  final Function onEditRole;
  late bool isEdtiable;
  EmployeeCard(
      {required this.model, required this.onDelete, required this.onEdit,required this.isEdtiable,required this.onEditRole});

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<EmployeeCard> {
 late TextEditingController fullName;
 late TextEditingController phone;
 late TextEditingController email;
 late String? job;
 // late TextEditingController address;


 @override
  void initState() {
   super.initState();
   fullName =TextEditingController();
   fullName..text = widget.model.userName!;

   phone =TextEditingController();
   phone..text = widget.model.phone!;

   email =TextEditingController();
   email..text = widget.model.email!;


   widget.isEdtiable = false;
   job = checkRole();
  }

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
              // widget.model.image ==null ? Image.asset(StaticImage.profile , width: 100,height: 100,): Image.network(widget.model.image!,width: 100,height: 100,),
              // SizedBox(width: 20,),
              Flexible(flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          S.of(context).emailOrPhone,
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:Text(
                          widget.model.email ?? '',
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
                          S.of(context).name,
                          style: AppTextStyle.mediumBlack,
                        ),
                         Expanded(child: widget.isEdtiable ?
                        TextField(controller: fullName,):  Text(
                          widget.model.userName ?? '',
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
                          S.of(context).phone+': ',
                          style: AppTextStyle.mediumBlack,
                        ),
                      Expanded(child:   widget.isEdtiable ? TextField(controller: phone, keyboardType: TextInputType.phone,) :  Text(
                          widget.model.phone ?? '',
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
                          S.of(context).jobDescription+": ",
                          style: AppTextStyle.mediumBlack,
                        ),
                        Expanded(child:

                         Text(
                          job ?? '',
                          style: AppTextStyle.mediumBlueBold,
                        ),
                        )],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        widget.onEditRole(widget.model);
                      },
                      child: Text(
                        S.of(context).updateEmployeeJop,
                        style: AppTextStyle.mediumWhite,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        widget.onDelete(widget.model.UserID);
                      },
                      child: Text(
                        S.of(context).delete,
                        style: AppTextStyle.mediumWhite,
                      ),
                    ),
                     SizedBox(
                       height: 10,
                     ),
                     widget.isEdtiable ? ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         primary: Colors.green,
                       ),
                       onPressed: () {
                         if(fullName.text.isEmpty  || phone.text.isEmpty){
                           AlertWidget.showAlert(context, false, S.of(context).fillAllField);
                         }else {
                           email.text= 'tanous';
                           EmployeeRequest re =
                           EmployeeRequest(id: widget.model.id ,userName: fullName.text,phone: phone.text,UserID:widget.model.UserID??'');
                             widget.onEdit(re);
                         }

                       },
                       child: Text(
                         'save',
                         style: AppTextStyle.mediumWhite,
                       ),
                     ) : ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         primary: Colors.green,
                       ),
                       onPressed: () {
                         setState(() {
                           widget.isEdtiable= true;
                         });
                       },
                       child: Text(
                         'edit',
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

 String? checkRole()  {
   for(var kes in EmployeeRoleName.keys){
     print('in for');
     print(EmployeeRoleName[kes]);
     if(ListEquality().equals (widget.model.roles , EmployeeRoleName[kes])){
       return kes;
     }
   }
 }
}
