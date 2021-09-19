import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';

class EditShipmentState{}

class SuccessfullyFirstState extends EditShipmentState{
 List<ReceiverModel> receivers;
 List<Mark> marks;

 SuccessfullyFirstState({required this.receivers,required this.marks});
}
class SuccessfullySecondState extends EditShipmentState{
 List<DistributorModel> distributors;
 List<UnitModel> units;
 List<ProductModel> categories;

 SuccessfullySecondState({required this.distributors,required this.units , required this.categories});
}
class LoadingFirstState extends EditShipmentState{}
class LoadingSecondState extends EditShipmentState{}

class ConfirmedEditedState extends EditShipmentState {
 ConfirmResponse response;

 ConfirmedEditedState(this.response);
}
class ErrorState extends EditShipmentState{
 String error;

 ErrorState(this.error);
}