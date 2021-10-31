import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_add_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/service/finance_airwaybill_service.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/airwaybill_finance_state/airwatbill_finance_state.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_proxies/service/proixes_service.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_fliter_request.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AirwaybillFinanceStateManager {
  final FinanceAirwaybillService _service;
  final SubcontractService _subcontractService;
  final ProxyService _proxyService;

  final PublishSubject<FinanceAirwaybillState> _stateSubject = PublishSubject();
  Stream<FinanceAirwaybillState> get stateStream => _stateSubject.stream;

  AirwaybillFinanceStateManager(this._service, this._subcontractService, this._proxyService);
  //
  void getAirwaybillLCLFinance(AirwaybillFilterFinanceRequest request) {
    _stateSubject.add(LoadingState());
    _service.getAirwaybillLCLFinance(request).then((value) {
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
  void getAirwaybillFCLFinance(AirwaybillFilterFinanceRequest request) {
    _stateSubject.add(LoadingState());
    _service.getAirwaybillFCLFinance(request).then((value) {
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

  void createAirwaybillFCLFinance(AirwaybillAddFinanceRequest financeRequest,List<SubcontractModel> subs,List<ProxyModel> proxies) {
    _stateSubject.add(LoadingState());
    _service.createAirwaybillFCLFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          AirwaybillFilterFinanceRequest request =AirwaybillFilterFinanceRequest(id: financeRequest.airwaybillID!);
          _service
              .getAirwaybillFCLFinance(request)
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
  void createAirwaybillLCLFinance(AirwaybillAddFinanceRequest financeRequest,List<SubcontractModel> subs,List<ProxyModel> proxies) {
    _stateSubject.add(LoadingState());
    _service.createAirwaybillLCLFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          AirwaybillFilterFinanceRequest request = AirwaybillFilterFinanceRequest(id: financeRequest.airwaybillID!);
          _service
              .getAirwaybillLCLFinance(request)
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
