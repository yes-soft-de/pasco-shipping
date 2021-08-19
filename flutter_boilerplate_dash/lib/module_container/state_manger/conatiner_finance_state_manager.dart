import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/request/conatiner_filter_finance_request.dart';
import 'package:pasco_shipping/module_container/request/container_add_finance_request.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_container/ui/state/container_finance_state/container_finance_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ContainerFinanceStateManager {
  final ContainerService _service;

  final PublishSubject<FinanceContainerState> _stateSubject = PublishSubject();
  Stream<FinanceContainerState> get stateStream => _stateSubject.stream;

  ContainerFinanceStateManager(this._service);
  //
  void getContainerFinance(ContainerFilterFinanceRequest request) {
    _stateSubject.add(LoadingState());
    _service.getContainerFinance(request).then((value) {
      print(value);
      if (value != null) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else {
        _stateSubject.add(ErrorState('Error', false));
      }
    });
  }

  void addContainerFinance(ContainerAddFinanceRequest financeRequest) {
    _stateSubject.add(LoadingState());
    _service.createContainerFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          ContainerFilterFinanceRequest request = ContainerFilterFinanceRequest(id: financeRequest.containerID!);
          _service
              .getContainerFinance(request)
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
