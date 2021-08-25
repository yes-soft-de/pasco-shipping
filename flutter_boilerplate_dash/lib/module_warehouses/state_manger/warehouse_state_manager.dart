
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_request.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_request.dart';
import 'package:pasco_shipping/module_warehouses/service/warehouse_service.dart';
import 'package:pasco_shipping/module_warehouses/ui/state/warehouse_state/warehouse_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class WarehouseStateManager{
  final WarehouseService _service;

  final PublishSubject<WarehousesState> _stateSubject = PublishSubject();
  Stream<WarehousesState> get stateStream => _stateSubject.stream;

  WarehouseStateManager(this._service);

  void getWarehouses(WarehouseFilterRequest request){
    _stateSubject.add(LoadingState());
    _service.getWarehouses(request).then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteWarehouses(String id){
    _stateSubject.add(LoadingState());
    _service.deleteWarehouses(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          WarehouseFilterRequest request =WarehouseFilterRequest(typeOfCountry: '', cityName: '');
          _service.getWarehouses(request).then((marks) {
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

  void updateWarehouses(WarehouseRequest request){
    _stateSubject.add(LoadingState());
    _service.updateWarehouses(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          WarehouseFilterRequest request =WarehouseFilterRequest(typeOfCountry: '', cityName: '');

          _service.getWarehouses(request).then((marks) {
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