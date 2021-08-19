import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/filter_container_state/filter_state.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class FilterAirwaybillStateManager {
  // final ContainerService _service;
  final SubcontractService _subcontractService;

  final PublishSubject<FilterAirwaybillState> _addStateSubject = PublishSubject();
  Stream<FilterAirwaybillState> get stateStream => _addStateSubject.stream;

  FilterAirwaybillStateManager(this._subcontractService);


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
