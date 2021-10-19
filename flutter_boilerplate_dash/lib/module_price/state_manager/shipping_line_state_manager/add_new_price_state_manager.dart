import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/service/price_service.dart';
import 'package:pasco_shipping/module_price/ui/state/shipline_price/addNew_state/add__lines_state.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddLinePriceStateManager {
  final PriceService _priceService;
  final FirstOptionService _firstOptionService;


  final PublishSubject<AddLinesPriceState> _addStateSubject = PublishSubject();
  Stream<AddLinesPriceState> get stateStream => _addStateSubject.stream;

  AddLinePriceStateManager(this._priceService, this._firstOptionService,);

  void getCountries(){
    _addStateSubject.add(LoadingAddState());
    _firstOptionService.getCountriesImport('import').then((imports) {
      if(imports != null){
        _firstOptionService.getCountriesImport('export').then((exports) {
          if(exports != null){
            _addStateSubject.add(InitAddState(countriesExport: exports,countriesImport: imports));
          }else{
            _addStateSubject.add(ErrorAddState('error'));
          }
        });
      }else{
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

  void createShippingLinePrice(ShippingLinePriceRequest request) {
    _addStateSubject.add(LoadingAddState());
    _priceService.createShippingLinePrice(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
  void updateShippingLinePrice(ShippingLinePriceRequest request) {
    _addStateSubject.add(LoadingAddState());
    _priceService.updateShippingLinePrice(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

}