
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_product_category/request/product_caetgory_request.dart';
import 'package:pasco_shipping/module_product_category/service/product_service.dart';
import 'package:pasco_shipping/module_product_category/ui/state/sub_contract_service_state/products_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ProductStateManager{
  final ProductService _service;

  final PublishSubject<ProductState> _stateSubject = PublishSubject();
  Stream<ProductState> get stateStream => _stateSubject.stream;

  ProductStateManager(this._service);

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

  void updateProduct(ProductRequest request){
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