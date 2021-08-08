import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_distributors/service/distributors_service.dart';
import 'package:pasco_shipping/module_mark/service/mark_service.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/request_shipment_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class RequestShipmentStateManger {
  final FirstOptionService _firstOptionService;
  final MarkService _markService;

  final ClientService _clientService;
  final DistributorService _distributorService;
  final PublishSubject<RequestShipmentState> _stateSubject = PublishSubject();
  Stream<RequestShipmentState> get stateStream => _stateSubject.stream;

  RequestShipmentStateManger(this._firstOptionService, this._markService,
      this._clientService, this._distributorService);

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

  void getSecondOption(String userID) {
    _stateSubject.add(LoadingState());
    _markService.getUserMark(userID).then((marks) {
      if (marks == null) {
        _stateSubject.add(errorState('error connection'));
      } else {
        _stateSubject.add(SecondOptionFetchingDataState(marks));
      }
    });
  }

  void getThirdOption() {
    _stateSubject.add(LoadingState());
    _clientService.getClients().then((clients) {
      if (clients != null) {
        _distributorService.getDistributors().then((distributor) {
          if (distributor != null) {
            _stateSubject
                .add(ThirdOptionFetchingDataState(distributor, clients));
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
