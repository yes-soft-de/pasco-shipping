import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_distributors/service/distributors_service.dart';
import 'package:pasco_shipping/module_mark/service/mark_service.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_filter_request.dart';
import 'package:pasco_shipping/module_receiver/service/receiver_service.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/request_shipment_state.dart';
import 'package:pasco_shipping/module_unit/service/unit_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class RequestShipmentStateManger {
  final FirstOptionService _firstOptionService;
  final MarkService _markService;
  final ReceiverService _receiverService;

  final ClientService _clientService;
  final DistributorService _distributorService;

  final UnitService _unitService;

  final PublishSubject<RequestShipmentState> _stateSubject = PublishSubject();
  Stream<RequestShipmentState> get stateStream => _stateSubject.stream;

  RequestShipmentStateManger(this._firstOptionService, this._markService,
      this._clientService, this._distributorService, this._receiverService, this._unitService);

  void getFirstOption() {
    _stateSubject.add(LoadingState());

    _firstOptionService.getWarehouse().then((warehouses) {
      if (warehouses == null) {
        _stateSubject.add(errorState('error connection'));
      } else {
        _firstOptionService.getCategories().then((categories) {
          if (categories == null) {
            _stateSubject.add(errorState('error connection'));
          } else {
            _stateSubject.add(FirstOptionFetchingDataState(
                categories: categories, warehouses: warehouses));
          }
        });
      }
    });
  }

  void getSecondOption() {
    _stateSubject.add(LoadingState());
    _clientService.getClients().then((marks) {
      if (marks == null) {
        _stateSubject.add(errorState('error connection'));
      } else {
        _unitService.getUnits().then((units) {
          if(units != null){
            _stateSubject.add(SecondOptionFetchingDataState(marks,units));
          }else{
            _stateSubject.add(errorState('error connection'));
          }
        });
      }
    });
  }

  void getThirdOption(String UserID) {
    _stateSubject.add(LoadingState());
    _markService.getUserMark(UserID).then((marks) {
      if (marks != null) {
        _distributorService.getDistributors().then((distributor) {
          if (distributor != null) {
            ReceiverFilterRequest request =ReceiverFilterRequest(int.parse(UserID));
            _receiverService.getUserReceiver(request).then((receivers){
              if(receivers != null){
                _stateSubject
                    .add(ThirdOptionFetchingDataState(distributor, marks,receivers));
              }else {
                _stateSubject.add(errorState('error connection'));
              }
            });

          } else {
            _stateSubject.add(errorState('error connection'));
          }
        });
      } else {
        _stateSubject.add(errorState('error connection'));
      }
    });
  }

}
