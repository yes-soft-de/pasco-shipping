
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_product_sub_category/request/product__sub_caetgory_request.dart';
import 'package:pasco_shipping/module_product_sub_category/service/sub_product_service.dart';
import 'package:pasco_shipping/module_product_sub_category/ui/state/sub_product_state/products_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class SubProductStateManager{
  final SubProductService _service;

  final PublishSubject<SubProductState> _stateSubject = PublishSubject();
  Stream<SubProductState> get stateStream => _stateSubject.stream;

  SubProductStateManager(this._service);

  void getProduct(){
    _stateSubject.add(LoadingState());
    _service.getProduct().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteProduct(String id){
    _stateSubject.add(LoadingState());
    _service.deleteProduct(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getProduct().then((marks) {
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

  void updateProduct(SubProductRequest request){
    _stateSubject.add(LoadingState());
    _service.updateProduct(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getProduct().then((marks) {
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