
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_countries/service/country_service.dart';
import 'package:pasco_shipping/module_proxies/service/proixes_service.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_request.dart';
import 'package:pasco_shipping/module_warehouses/service/warehouse_service.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddWarehouseStateManager{
  final WarehouseService _service;
  final SubcontractService _subcontractService;
  final ProxyService _proxyService;
  final CountryService _countryService;

  final PublishSubject<AddWarehouseState> _addStateSubject = PublishSubject();
  Stream<AddWarehouseState> get stateStream => _addStateSubject.stream;

  AddWarehouseStateManager(this._service, this._subcontractService, this._proxyService, this._countryService);

  void createWarehouses(WarehouseRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createWarehouses(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _addStateSubject.add(SuccessfullyAddState(value));
        }
        else{
          _addStateSubject.add(ErrorAddState('error'));
        }
      }else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
  void updateWarehouses(WarehouseRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.updateWarehouses(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _addStateSubject.add(SuccessfullyAddState(value));
        }
        else{
          _addStateSubject.add(ErrorAddState('error'));
        }
      }else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
  void getSubContractAndProxyAndCountry(){
    _subcontractService.getSubcontracts().then((subcontracts){
      if(subcontracts != null){
        _proxyService.getProxies().then((proxies){
          if(proxies != null){
            _countryService.getCountries().then((countries) {
              if(countries != null){
                _addStateSubject.add(InitAddState(proxies , subcontracts,countries));
              }else {
                _addStateSubject.add(ErrorAddState('error'));
              }
            });
          }else {
            _addStateSubject.add(ErrorAddState('error'));
          }
        });
      }else{
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
}