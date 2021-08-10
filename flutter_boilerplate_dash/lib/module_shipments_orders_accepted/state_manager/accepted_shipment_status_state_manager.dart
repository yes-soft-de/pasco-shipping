import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/measured_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/received_deliered_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/stored_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/service/accepted_shipment_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_status_state/accepted_shipment_status_state.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AcceptedShipmentsStatusStateManager {
  final AcceptedShipmentService _service;
  final SubcontractService _subcontractService;
  final ContainerService _containerService;

  final PublishSubject<AcceptedShipmentStatusState> _stateSubject = PublishSubject();
  Stream<AcceptedShipmentStatusState> get stateStream => _stateSubject.stream;

  AcceptedShipmentsStatusStateManager(this._service, this._subcontractService, this._containerService);

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

  void receivedOrDelevired(ReceivedOrDeliveredRequest request ,String cityName){
    _stateSubject.add(LoadingState());
    _service.changeShipmentStatus(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getAcceptedShipmentStatus(request.shipmentId.toString(),request.trackNumber).then((model) {
            if (model != null) {
              _subcontractService.getSubcontracts().then((subcontracts) {
                if(subcontracts != null){
                  _service.getWarehouse(cityName).then((warehouses) {
                    if(warehouses != null) {
                      _stateSubject.add(ReceivedStatusState(model , subcontracts ,warehouses));
                    }
                  });
                }
              });
            }else {
              _stateSubject.add(ErrorState('Error'));
            }
          });
        }
      }
    });
  }

  void measuredShipment(MeasuredRequest request , ContainerFilterRequest containerFilterRequest){
    _stateSubject.add(LoadingState());
    _service.measuredShipment(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getAcceptedShipmentStatus(request.shipmentId.toString(),request.trackNumber).then((model) {
            if (model != null) {
              _containerService.getContainersWithFilter(containerFilterRequest).then((containers) {
                if(containers != null){
                      _stateSubject.add(MeasuredStatusState(model , containers));
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

  void storedShipment(StoredRequest request){
    _stateSubject.add(LoadingState());
    _service.storedShipment(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getAcceptedShipmentStatus(request.shipmentId.toString(),request.trackNumber).then((model) {
            if (model != null) {
              print('model stored');
              _stateSubject.add(AcceptedStatusState(model));
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
            _service.getWarehouse(cityName).then((warehouses) {
              if(warehouses != null) {
                _stateSubject.add(ReceivedStatusState(model , subcontracts ,warehouses));
              }
            });
          }
        });
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }

  void getMeasuredStatus(String shipmentID ,ContainerFilterRequest containerFilterRequest,String trackNumber){
    _service.getAcceptedShipmentStatus(shipmentID,trackNumber).then((model) {
      if (model != null) {
        _containerService.getContainersWithFilter(containerFilterRequest).then((containers) {
          if(containers != null){
            _stateSubject.add(MeasuredStatusState(model , containers));
          }else {
            _stateSubject.add(ErrorState('Error'));
          }
        });
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }
}