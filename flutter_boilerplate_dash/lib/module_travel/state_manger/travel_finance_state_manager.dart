import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_travel/request/travel_add_finance_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_finance_request.dart';
import 'package:pasco_shipping/module_travel/service/travel_service.dart';
import 'package:pasco_shipping/module_travel/ui/state/travel_finance_state/travel_finance_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class TravelFinanceStateManager {
  final TravelService _service;

  final PublishSubject<FinanceTravelState> _stateSubject = PublishSubject();
  Stream<FinanceTravelState> get stateStream => _stateSubject.stream;

  TravelFinanceStateManager(this._service);
  //
  void getTravelFinance(TravelFilterFinanceRequest request) {
    _stateSubject.add(LoadingState());
    _service.getTravelFinance(request).then((value) {
      print(value);
      if (value != null) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else {
        _stateSubject.add(ErrorState('Error', false));
      }
    });
  }

  void addTravelFinance(TravelAddFinanceRequest financeRequest) {
    _stateSubject.add(LoadingState());
    _service.createTravelFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          TravelFilterFinanceRequest request = TravelFilterFinanceRequest(id: financeRequest.travelID!);
          _service
              .getTravelFinance(request)
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
