import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_add_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/service/airwaybill_service.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/airwaybill_finance_state/airwatbill_finance_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AirwaybillFinanceStateManager {
  final AirwaybillService _service;

  final PublishSubject<FinanceAirwaybillState> _stateSubject = PublishSubject();
  Stream<FinanceAirwaybillState> get stateStream => _stateSubject.stream;

  AirwaybillFinanceStateManager(this._service);
  //
  void getAirwaybillFinance(AirwaybillFilterFinanceRequest request) {
    _stateSubject.add(LoadingState());
    _service.getAirwaybillFinance(request).then((value) {
      print(value);
      if (value != null) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else {
        _stateSubject.add(ErrorState('Error', false));
      }
    });
  }

  void addAirwaybillFinance(AirwaybillAddFinanceRequest financeRequest) {
    _stateSubject.add(LoadingState());
    _service.createAirwaybillFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          AirwaybillFilterFinanceRequest request = AirwaybillFilterFinanceRequest(id: financeRequest.airwaybillID!);
          _service
              .getAirwaybillFinance(request)
              .then((finances) {
            if (finances != null) {
              _stateSubject.add(SuccessfullyFetchState(finances));
            } else {
              _stateSubject.add(ErrorState('Error', false));
            }
          });
        } else {
          _stateSubject.add(ErrorState('Error', false));
        }
      }
    });
  }
}
