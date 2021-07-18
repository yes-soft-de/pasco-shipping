
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_proxies/request/proxies_request.dart';
import 'package:pasco_shipping/module_proxies/service/proixes_service.dart';
import 'package:pasco_shipping/module_proxies/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddProxyStateManager{
  final ProxyService _proxyService;

  final PublishSubject<AddProxyState> _addStateSubject = PublishSubject();
  Stream<AddProxyState> get stateStream => _addStateSubject.stream;

  AddProxyStateManager(this._proxyService);

  void createProxy(ProxyRequest request){
    _addStateSubject.add(LoadingAddState());
    _proxyService.createProxy(request).then((value) {
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