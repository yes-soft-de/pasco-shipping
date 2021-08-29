import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_employees/response/employees_response.dart';
import 'package:pasco_shipping/module_employees/widget/employe_card.dart';

class EmployeesSuccessfully extends StatelessWidget {
  final List<EmployeeModel> items;
  final Function onDelete;
  final Function onEdit;
  const EmployeesSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return EmployeeCard(model: items[index],
      onEdit: (re){
        onEdit(re);
      },
        onDelete: (id){
        onDelete(id);
        }, isEdtiable: false,
      );
    },itemCount: items.length,
      shrinkWrap: true,
    )
    ;
  }
}
