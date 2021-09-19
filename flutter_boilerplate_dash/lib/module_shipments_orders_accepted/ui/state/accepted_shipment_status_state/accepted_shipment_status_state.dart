import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_gunny/response/gunny_response.dart';
import 'package:pasco_shipping/module_gunny/response/stored_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';

class AcceptedShipmentStatusState{}

class AcceptedStatusState extends AcceptedShipmentStatusState{
  List<AcceptedShipmentStatusModel> model;
  AcceptedStatusState(this.model);
}
class DelivredStatusState extends AcceptedShipmentStatusState{
  List<AcceptedShipmentStatusModel> model;
  DelivredStatusState(this.model);
}

class ReceivedStatusState extends AcceptedShipmentStatusState{
  List<AcceptedShipmentStatusModel> model;
  List<SubcontractModel> subContracts;
  List<WarehousesModel> warehouse;
  List<GunnyModel> gunnies;
  StoredModel storedModelInfo;
  ReceivedStatusState(this.model , this.subContracts , this.warehouse , this.gunnies ,this.storedModelInfo);
}


class ReceivedStatusWithGunniesState extends AcceptedShipmentStatusState{
  List<AcceptedShipmentStatusModel> model;
  List<SubcontractModel> subContracts;
  List<WarehousesModel> warehouse;
  List<GunnyModel> gunnies;
  StoredModel storedModelInfo;
  ReceivedStatusWithGunniesState(this.model , this.subContracts , this.warehouse , this.gunnies ,this.storedModelInfo);
}



class MeasuredContainerStatusState extends AcceptedShipmentStatusState{
  List<AcceptedShipmentStatusModel> model;
  List<ContainerModel> containers;
  List<TravelModel> travels;
  MeasuredContainerStatusState({required this.model ,required this.containers ,required this.travels});
}

class MeasuredAirwaybillStatusState extends AcceptedShipmentStatusState{
  List<AcceptedShipmentStatusModel> model;
  List<AirwaybillModel> airwaybills;
  List<TravelModel> travels;
  MeasuredAirwaybillStatusState({required this.model ,required this.airwaybills ,required this.travels});
}


class DetailsStatusState extends AcceptedShipmentStatusState{
  List<AcceptedShipmentStatusModel> model;
  DetailsStatusState(this.model);
}

class LoadingState extends AcceptedShipmentStatusState{}

class SuccessfullyModifyState extends AcceptedShipmentStatusState{
  ConfirmResponse response;
  SuccessfullyModifyState(this.response);
}

class ErrorState extends AcceptedShipmentStatusState{
  String error;

  ErrorState(this.error);
}
class createGunnyLoading extends AcceptedShipmentStatusState{
}