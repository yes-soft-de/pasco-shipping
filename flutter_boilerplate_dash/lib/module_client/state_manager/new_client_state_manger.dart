
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/request/create_client_request.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_client/ui/state/add_new_client/add_new_client_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddClientStateManager{
  final ClientService _service;

  final PublishSubject<AddClientState> _addStateSubject = PublishSubject();
  Stream<AddClientState> get stateStream => _addStateSubject.stream;

  AddClientStateManager(this._service);

  void createClient(CreateClientRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createClient(request).then((value) {
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