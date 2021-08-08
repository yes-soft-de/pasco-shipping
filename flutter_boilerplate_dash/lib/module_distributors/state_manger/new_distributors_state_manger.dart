
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_distributors/request/distributors_request.dart';
import 'package:pasco_shipping/module_distributors/service/distributors_service.dart';
import 'package:pasco_shipping/module_distributors/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddDistributorStateManager{
  final DistributorService _distributorService;

  final PublishSubject<AddDistributorsState> _addStateSubject = PublishSubject();
  Stream<AddDistributorsState> get stateStream => _addStateSubject.stream;

  AddDistributorStateManager(this._distributorService);

  void createDistributor(DistributorRequest request){
    _addStateSubject.add(LoadingAddState());
    _distributorService.createDistributor(request).then((value) {
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
}