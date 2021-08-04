import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/service/container_service.dart';
import 'package:pasco_shipping/module_container/ui/state/filter_container_state/filter_state.dart';
import 'package:pasco_shipping/module_countries/service/country_service.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class FilterContainerStateManager {
  // final ContainerService _service;
  final SubcontractService _subcontractService;

  final PublishSubject<FilterContainerState> _addStateSubject = PublishSubject();
  Stream<FilterContainerState> get stateStream => _addStateSubject.stream;

  FilterContainerStateManager(this._subcontractService);


  void getSubContract() {
    _addStateSubject.add(LoadingFilterState());
        _subcontractService.getSubcontracts().then((subs) {
          if (subs != null) {
            _addStateSubject
                .add(InitFilterState(subcontracts: subs));
          } else {
            _addStateSubject.add(ErrorFilterState('error'));
          }
    });
  }
}
