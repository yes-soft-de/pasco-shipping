
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_product_category/request/product_caetgory_request.dart';
import 'package:pasco_shipping/module_product_category/service/product_service.dart';
import 'package:pasco_shipping/module_product_category/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddProductStateManager{
  final ProductService _service;

  final PublishSubject<AddProductState> _addStateSubject = PublishSubject();
  Stream<AddProductState> get stateStream => _addStateSubject.stream;

  AddProductStateManager(this._service);

  void createSubContractService(ProductRequest request){
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
}