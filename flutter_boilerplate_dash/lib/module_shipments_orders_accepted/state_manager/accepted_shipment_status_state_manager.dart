import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_airwaybill/service/airwaybill_service.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_gunny/request/add_shipment_to_gunny_request.dart';
import 'package:pasco_shipping/module_gunny/response/gunny_response.dart';
import 'package:pasco_shipping/module_gunny/response/stored_response.dart';
import 'package:pasco_shipping/module_gunny/service/gunny_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/measured_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/received_deliered_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/stored_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/service/accepted_shipment_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_state.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/module_travel/service/travel_service.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';
import 'package:pasco_shipping/module_warehouses/service/warehouse_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AcceptedShipmentsStatusStateManager {
  final AcceptedShipmentService _service;
  final SubcontractService _subcontractService;
  final ContainerService _containerService;
  final AirwaybillService _airwaybillService;
  final TravelService _travelService;
  final WarehouseService _warehouseService;
  final GunnyService _gunnyService;

  final PublishSubject<AcceptedShipmentStatusState> _stateSubject = PublishSubject();
  Stream<AcceptedShipmentStatusState> get stateStream => _stateSubject.stream;

  AcceptedShipmentsStatusStateManager(this._service, this._subcontractService, this._containerService, this._travelService, this._warehouseService, this._airwaybillService, this._gunnyService);

  void getShipmentStatus(String id ,String trackNumber) {
    _stateSubject.add(LoadingState());
    _service.getAcceptedShipmentStatus(id,trackNumber).then((value) {
      if (value != null) {
        _stateSubject.add(AcceptedStatusState(value));
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }

  void receivedOrDelevired(ReceivedOrDeliveredRequest request ,String cityName , bool isDelivred){
    print("rahaf " + isDelivred.toString());
    _stateSubject.add(LoadingState());
    _service.changeShipmentStatus(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getAcceptedShipmentStatus(request.shipmentId.toString(),request.trackNumber).then((model) {
            if (model != null) {
              print("is Deleivred");
              if(isDelivred){
                print(isDelivred);
                _stateSubject.add(AcceptedStatusState(model));
              }else {
                print('received_status');
                _subcontractService.getSubcontracts().then((subcontracts) {
                  if (subcontracts != null) {
                    WarehouseFilterRequest request = WarehouseFilterRequest(cityName: cityName);
                    _warehouseService.getWarehouses(request).then((warehouses) {
                      if (warehouses != null) {
                        _gunnyService.getGunnies().then((gunnies) {
                          if(gunnies != null){
                            _stateSubject.add(ReceivedStatusState(
                                model, subcontracts, warehouses ,gunnies,StoredModel(remainedQuantity: '')));
                          }else{
                            _stateSubject.add(ErrorState('Error'));
                          }
                        });

                      }else {
                        _stateSubject.add(ErrorState('Error'));
                      }
                    });
                  }else {
                    _stateSubject.add(ErrorState('Error'));
                  }
                });
              }}else {
              _stateSubject.add(ErrorState('Error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }

  void measuredContainerShipment(MeasuredRequest request , ContainerFilterRequest containerFilterRequest ,TravelFilterRequest travelFilterRequest){
    _stateSubject.add(LoadingState());
    _service.measuredShipment(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getAcceptedShipmentStatus(request.shipmentId.toString(),request.trackNumber).then((model) {
            if (model != null) {
              _containerService.getContainersWithFilter(containerFilterRequest).then((containers) {
                if(containers != null){
                  _travelService.getTravelsWithFilter(travelFilterRequest).then((travels){
                    if(travels != null) {
                      _stateSubject.add(MeasuredContainerStatusState(model: model , containers: containers , travels: travels));
                    }else {
                      _stateSubject.add(ErrorState('Error'));
                    }
                  });
                }
              });
            }else {
              _stateSubject.add(ErrorState('Error'));
            }
          });
        }else {
          _stateSubject.add(ErrorState('Error'));
        }
      }
    });
  }
  void measuredAirwaybillShipment(MeasuredRequest request , AirwaybillFilterRequest containerFilterRequest ,TravelFilterRequest travelFilterRequest){
    _stateSubject.add(LoadingState());
    _service.measuredShipment(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getAcceptedShipmentStatus(request.shipmentId.toString(),request.trackNumber).then((model) {
            if (model != null) {
              _airwaybillService.getAirwaybillWithFilter(containerFilterRequest).then((airwaybills) {
                if(airwaybills != null){
                  _travelService.getTravelsWithFilter(travelFilterRequest).then((travels){
                    if(travels != null) {
                      _stateSubject.add(MeasuredAirwaybillStatusState(model: model , airwaybills: airwaybills , travels: travels));
                    }else {
                      _stateSubject.add(ErrorState('Error'));
                    }
                  });
                }
              });
            }else {
              _stateSubject.add(ErrorState('Error'));
            }
          });
        }else {
          _stateSubject.add(ErrorState('Error'));
        }
      }
    });
  }

  void storedContainerShipment(StoredRequest request , bool isSaperate , List<ContainerModel> containers , List<TravelModel> travels){
    _stateSubject.add(LoadingState());
    _service.storedShipment(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getAcceptedShipmentStatus(request.shipmentId.toString(),request.trackNumber).then((model) {
            if (model != null) {
              if(isSaperate){
                _stateSubject.add(MeasuredContainerStatusState(model: model , containers: containers ,travels: travels));
              }
              else {
                _stateSubject.add(AcceptedStatusState(model));
              }
            }else {
              _stateSubject.add(ErrorState('Error'));
            }
          });
        }else {
          _stateSubject.add(ErrorState('Error'));
        }
      }
    });
  }
  void storedAirwaybillShipment(StoredRequest request , bool isSaperate , List<AirwaybillModel> airwaybills , List<TravelModel> travels){
    _stateSubject.add(LoadingState());
    _service.storedShipment(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getAcceptedShipmentStatus(request.shipmentId.toString(),request.trackNumber).then((model) {
            if (model != null) {
              if(isSaperate){
                _stateSubject.add(MeasuredAirwaybillStatusState(model: model , airwaybills: airwaybills ,travels: travels));
              }
              else {
                _stateSubject.add(AcceptedStatusState(model));
              }
            }else {
              _stateSubject.add(ErrorState('Error'));
            }
          });
        }else {
          _stateSubject.add(ErrorState('Error'));
        }
      }
    });
  }


  void getReceivedStatus(String shipmentID ,String cityName ,String trackNumber){
    _service.getAcceptedShipmentStatus(shipmentID,trackNumber).then((model) {
      if (model != null) {
        _subcontractService.getSubcontracts().then((subcontracts) {
          if(subcontracts != null){
            WarehouseFilterRequest request = WarehouseFilterRequest(cityName: cityName);
            _warehouseService.getWarehouses(request).then((warehouses) {
              if(warehouses != null) {
                _gunnyService.getGunnies().then((gunnies) {
                  if(gunnies != null){
                    _stateSubject.add(ReceivedStatusState(model , subcontracts ,warehouses,gunnies,StoredModel(remainedQuantity: '')));
                  }else{
                    _stateSubject.add(ErrorState('Error'));
                  }
                });
              }
            });
          }
        });
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }

  void getMeasuredContainerStatus(String shipmentID ,ContainerFilterRequest containerFilterRequest,String trackNumber ,TravelFilterRequest travelFilterRequest){
    _service.getAcceptedShipmentStatus(shipmentID,trackNumber).then((model) {
      if (model != null) {
        _containerService.getContainersWithFilter(containerFilterRequest).then((containers) {
          if(containers != null){
            _travelService.getTravelsWithFilter(travelFilterRequest).then((travels){
              if(travels != null){
                _stateSubject.add(MeasuredContainerStatusState(model: model , containers: containers,travels: travels));
              }
            });
          }else {
            _stateSubject.add(ErrorState('Error'));
          }
        });
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }
  void getMeasuredAirwaybillStatus(String shipmentID ,AirwaybillFilterRequest airwaybillFilterRequest,String trackNumber ,TravelFilterRequest travelFilterRequest){
    _service.getAcceptedShipmentStatus(shipmentID,trackNumber).then((model) {
      if (model != null) {
        _airwaybillService.getAirwaybillWithFilter(airwaybillFilterRequest).then((airwaybills) {
          if(airwaybills != null){
            _travelService.getTravelsWithFilter(travelFilterRequest).then((travels){
              if(travels != null){
                _stateSubject.add(MeasuredAirwaybillStatusState(model: model , airwaybills: airwaybills,travels: travels));
              }
            });
          }else {
            _stateSubject.add(ErrorState('Error'));
          }
        });
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }



  void delevired(ReceivedOrDeliveredRequest request ,String cityName){
    _stateSubject.add(LoadingState());
    _service.changeShipmentStatus(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getAcceptedShipmentStatus(request.shipmentId.toString(),request.trackNumber).then((model) {
            if (model != null) {
              _stateSubject.add(AcceptedStatusState(model));
            }else {
              _stateSubject.add(ErrorState('Error'));
            }
          });
        }
      }
    });
  }


  void createGunny(List<AcceptedShipmentStatusModel> model ,  List<SubcontractModel> subcontracts ,List<WarehousesModel> warehouses){
    _stateSubject.add(LoadingState());
    _gunnyService.createGunny().then((gunnies) {
      if(gunnies != null){
        _stateSubject.add(ReceivedStatusState(
            model, subcontracts, warehouses ,gunnies ,StoredModel(remainedQuantity: '')));
      }else{
        _stateSubject.add(ErrorState('Error'));
      }
    });

  }

  void storedShipmentInGunny(AddShipmentToGunnyRequest request,List<AcceptedShipmentStatusModel> model ,  List<SubcontractModel> subcontracts ,List<WarehousesModel> warehouses,List<GunnyModel> gunnies){
    _stateSubject.add(LoadingState());
    _gunnyService.addShipmentToGunny(request).then((storedModel) {
      if(storedModel != null){
        print(storedModel.remainedQuantity);
        _stateSubject.add(ReceivedStatusState(
            model, subcontracts, warehouses ,gunnies ,storedModel));
      }
    });
  }
}