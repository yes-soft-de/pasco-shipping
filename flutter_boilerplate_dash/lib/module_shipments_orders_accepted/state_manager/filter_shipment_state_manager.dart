import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_countries/service/country_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/filter_accepted_shipment_state/filter_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class FilterAcceptedShipmentStateManager {
  final CountryService _countryService;
  final ClientService _clientService;

  final PublishSubject<FilterAcceptedShipmentState> _addStateSubject = PublishSubject();
  Stream<FilterAcceptedShipmentState> get stateStream => _addStateSubject.stream;

  FilterAcceptedShipmentStateManager(this._countryService, this._clientService,);


  void getCountries() {
    _addStateSubject.add(LoadingFilterState());
    _countryService.getCountries().then((countries) {
      if (countries != null) {
        _clientService.getClients().then((clients) {
          if(clients != null){
            _addStateSubject.add(InitFilterState(countries ,clients));
          }
        });
      } else {
        _addStateSubject.add(ErrorFilterState('error'));
      }
    });
  }
}