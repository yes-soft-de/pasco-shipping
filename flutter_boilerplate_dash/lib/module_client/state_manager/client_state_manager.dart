
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_client/ui/state/clients_state/client_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ClientsStateManager{
  final ClientService _service;

  final PublishSubject<ClientsState> _stateSubject = PublishSubject();
  Stream<ClientsState> get stateStream => _stateSubject.stream;

  ClientsStateManager(this._service);

  void getClients(){
    _stateSubject.add(LoadingState());
    _service.getClients().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  // void deleteSupplier(String id){
  //   _stateSubject.add(LoadingState());
  //   _service.deleteSupplier(id).then((value) {
  //     if(value != null){
  //       if(value.isConfirmed){
  //         _service.getSuppliers().then((marks) {
  //           if(marks != null) {
  //             _stateSubject.add(SuccessfullyFetchState(marks));
  //           }else {
  //             _stateSubject.add(ErrorState('error'));
  //           }
  //         });
  //       }
  //     }else {
  //       _stateSubject.add(ErrorState('error'));
  //     }
  //   });
  // }
  //
  // void updateSupplier(SupplierRequest request){
  //   _stateSubject.add(LoadingState());
  //   _service.updateSupplier(request).then((value) {
  //     if(value != null){
  //       if(value.isConfirmed){
  //         _service.getSuppliers().then((marks) {
  //           if(marks != null) {
  //             _stateSubject.add(SuccessfullyFetchState(marks));
  //           }else {
  //             _stateSubject.add(ErrorState('error'));
  //           }
  //         });
  //       }
  //     }else {
  //       _stateSubject.add(ErrorState('error'));
  //     }
  //   });
  // }
}