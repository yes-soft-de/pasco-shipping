import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/request/conatiner_filter_finance_request.dart';
import 'package:pasco_shipping/module_container/request/container_add_finance_request.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_container/service/finance_container_service.dart';
import 'package:pasco_shipping/module_container/ui/state/container_finance_state/container_finance_state.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_proxies/service/proixes_service.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_fliter_request.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ContainerFinanceStateManager {
  final FinanceContainerService _service;
  final SubcontractService _subcontractService;
  final ProxyService _proxyService;

  final PublishSubject<FinanceContainerState> _stateSubject = PublishSubject();
  Stream<FinanceContainerState> get stateStream => _stateSubject.stream;

  ContainerFinanceStateManager(this._service, this._subcontractService, this._proxyService);
  //
  void getContainerLCLFinance(ContainerFilterFinanceRequest request) {
    _stateSubject.add(LoadingState());
    _service.getContainerLCLFinance(request).then((value) {
      print(value);
      if (value != null) {
        FilterSubcontractRequest request =FilterSubcontractRequest();
        _subcontractService.getSubcontracts(request).then((subs) {
          if(subs != null){
            _stateSubject.add(SuccessfullyFetchState(value,subs,[]));
          }
        });
      } else {
        _stateSubject.add(ErrorState('Error', false));
      }
    });
  }
  void getContainerFCLFinance(ContainerFilterFinanceRequest request) {
    _stateSubject.add(LoadingState());
    _service.getContainerFCLFinance(request).then((value) {
      print(value);
      if (value != null) {
        FilterSubcontractRequest request =FilterSubcontractRequest();
        _subcontractService.getSubcontracts(request).then((subs) {
          if(subs != null){
            _stateSubject.add(SuccessfullyFetchState(value,subs,[]));
          }
        });
      } else {
        _stateSubject.add(ErrorState('Error', false));
      }
    });
  }

  void createContainerFCLFinance(ContainerAddFinanceRequest financeRequest,List<SubcontractModel> subs , List<ProxyModel> proxies) {
    _stateSubject.add(LoadingState());
    _service.createContainerFCLFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          ContainerFilterFinanceRequest request = ContainerFilterFinanceRequest(id: financeRequest.containerID!);
          _service
              .getContainerFCLFinance(request)
              .then((finances) {
            if (finances != null) {
              _stateSubject.add(SuccessfullyFetchState(finances,subs,[]));
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
  void createContainerLCLFinance(ContainerAddFinanceRequest financeRequest,List<SubcontractModel> subs, List<ProxyModel> proxies) {
    _stateSubject.add(LoadingState());
    _service.createContainerLCLFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          ContainerFilterFinanceRequest request = ContainerFilterFinanceRequest(id: financeRequest.containerID!);
          _service
              .getContainerLCLFinance(request)
              .then((finances) {
            if (finances != null) {
              _stateSubject.add(SuccessfullyFetchState(finances,subs,[]));
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
