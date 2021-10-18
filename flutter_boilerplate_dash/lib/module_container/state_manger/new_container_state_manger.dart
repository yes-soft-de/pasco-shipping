import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_container/request/container_request.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_container/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_container_specification/service/container_specification_service.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/service/harbor_service.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:pasco_shipping/module_shipper/service/shipper_service.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddContainerStateManager {
  final ContainerService _service;
  final SubcontractService _subcontractService;
  final ContainerSpecificationService _containerSpecificationService;
  final ClientService _clientService;
  final HarborService _harborService;
  final ShipperService _shipperService;
  final FirstOptionService _firstOptionService;

  final PublishSubject<AddContainerState> _addStateSubject = PublishSubject();
  Stream<AddContainerState> get stateStream => _addStateSubject.stream;

  AddContainerStateManager(
      this._service,this._subcontractService , this._containerSpecificationService, this._clientService, this._harborService, this._shipperService, this._firstOptionService);

  void requestContainer(ContainerRequest request) {
    _addStateSubject.add(LoadingAddState());
    _service.requestContainer(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
  void updateContainer(ContainerRequest request) {
    _addStateSubject.add(LoadingAddState());
    _service.updateContainer(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState(value.message ??'error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
  void getSubContractAndSpecificationAndHarborAndCountries() {
    _addStateSubject.add(LoadingAddState());
        _subcontractService.getSubcontracts().then((subs) {
          if (subs != null) {
            _containerSpecificationService.getContainerSpecification().then((value){
              if(value != null){
                _clientService.getClients().then((clients) {
                  if(clients != null){
                    HarborFilterRequest request =HarborFilterRequest(type: 'seaport');
                    _harborService.getHarbor(request).then((harbor) {
                      if(harbor != null){
                        _firstOptionService.getCountriesImport('export').then((countries) {
                          if(countries != null){
                            _addStateSubject
                                .add(InitAddState(subcontracts: subs , specifications: value ,clients: clients,harbor: harbor,shippers: [] ,countries: countries));
                          }

                        });

                      }
                    });
                  }
                });
              } else {
                _addStateSubject.add(ErrorAddState('error'));
              }
            });
          } else {
            _addStateSubject.add(ErrorAddState('error'));
          }
        });
  }

  void getSubContractAndSpecificationAndHarborAndShipper() {
    _addStateSubject.add(LoadingAddState());
        _subcontractService.getSubcontracts().then((subs) {
          if (subs != null) {
            _containerSpecificationService.getContainerSpecification().then((value){
              if(value != null){
                _clientService.getClients().then((clients) {
                  if(clients != null){
                    HarborFilterRequest request =HarborFilterRequest(type: 'seaport');
                    _harborService.getHarbor(request).then((harbor) {
                      if(harbor != null){
                        _shipperService.getShippers().then((shippers) {
                          if(shippers != null){
                            _addStateSubject
                                .add(InitAddState(subcontracts: subs , specifications: value ,clients: clients,harbor: harbor,shippers: shippers,countries: []));
                          }
                        });
                      }
                    });
                  }
                });
              } else {
                _addStateSubject.add(ErrorAddState('error'));
              }
            });
          } else {
            _addStateSubject.add(ErrorAddState('error'));
          }
        });
  }

}
