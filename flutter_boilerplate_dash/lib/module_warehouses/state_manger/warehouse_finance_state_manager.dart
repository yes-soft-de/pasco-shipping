import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_add_finance_request.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_finance_request.dart';
import 'package:pasco_shipping/module_warehouses/service/warehouse_service.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/warehouse_finance_state/warehouse_finance_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class WarehouseFinanceStateManager {
  final WarehouseService _service;

  final PublishSubject<FinanceWarehouseState> _stateSubject = PublishSubject();
  Stream<FinanceWarehouseState> get stateStream => _stateSubject.stream;

  WarehouseFinanceStateManager(this._service);
  //
  void getWarehouseFinance(WarehouseFilterFinanceRequest request) {
    _stateSubject.add(LoadingState());
    _service.getWarehouseFinance(request).then((value) {
      print(value);
      if (value != null) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else {
        _stateSubject.add(ErrorState('Error', false));
      }
    });
  }

  void addWarehouseFinance(WarehouseAddFinanceRequest financeRequest) {
    _stateSubject.add(LoadingState());
    _service.createWarehouseFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          WarehouseFilterFinanceRequest request = WarehouseFilterFinanceRequest(id: financeRequest.warehouseID!);
          _service
              .getWarehouseFinance(request)
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
