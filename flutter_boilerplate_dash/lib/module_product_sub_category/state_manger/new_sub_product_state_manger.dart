
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_product_category/service/product_service.dart';
import 'package:pasco_shipping/module_product_sub_category/request/product__sub_caetgory_request.dart';
import 'package:pasco_shipping/module_product_sub_category/service/sub_product_service.dart';
import 'package:pasco_shipping/module_product_sub_category/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddSubProductStateManager{
  final SubProductService _service;
  final ProductService _productService;

  final PublishSubject<AddSubProductState> _addStateSubject = PublishSubject();
  Stream<AddSubProductState> get stateStream => _addStateSubject.stream;

  AddSubProductStateManager(this._service, this._productService);

  void createSubProduct(SubProductRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createProduct(request).then((value) {
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

  void getProducts (){
    _productService.getProduct().then((value) {
      if(value != null){
        _addStateSubject.add(InitAddState(value));
      }else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
}