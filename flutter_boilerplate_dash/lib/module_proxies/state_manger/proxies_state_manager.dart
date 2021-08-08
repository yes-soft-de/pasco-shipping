
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_proxies/request/proxies_request.dart';
import 'package:pasco_shipping/module_proxies/service/proixes_service.dart';
import 'package:pasco_shipping/module_proxies/ui/state/distributors_state/proxies_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ProxyStateManager{
  final ProxyService _proxyService;

  final PublishSubject<ProxiesState> _stateSubject = PublishSubject();
  Stream<ProxiesState> get stateStream => _stateSubject.stream;

  ProxyStateManager(this._proxyService);

  void getProxies(){
    _stateSubject.add(LoadingState());
    _proxyService.getProxies().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteProxy(String id){
    _stateSubject.add(LoadingState());
    _proxyService.deleteProxy(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _proxyService.getProxies().then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyFetchState(marks));
            }else {
              _stateSubject.add(ErrorState('error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });
  }

  void updateProxy(ProxyRequest request){
    _stateSubject.add(LoadingState());
    _proxyService.updateProxy(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _proxyService.getProxies().then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyFetchState(marks));
            }else {
              _stateSubject.add(ErrorState('error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });
  }
}