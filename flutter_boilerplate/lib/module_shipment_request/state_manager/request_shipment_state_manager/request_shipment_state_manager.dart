import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container_specification/service/container_specification_service.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/service/harbor_service.dart';
import 'package:pasco_shipping/module_mark/service/mark_service.dart';
import 'package:pasco_shipping/module_receiver/service/receiver_service.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:pasco_shipping/module_shipment_request/ui/states/request_shipment_state.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_unit/service/unit_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class RequestShipmentStateManger{
  final FirstOptionService _firstOptionService;
  final MarkService _markService;
  final UnitService _unitService;
  final ReceiverService _receiverService;



  final HarborService _harborService;
  final SubcontractService _subcontractService;

  final ContainerSpecificationService _containerSpecificationService;

  final PublishSubject<RequestShipmentState> _stateSubject = PublishSubject();
  Stream<RequestShipmentState> get stateStream => _stateSubject.stream;

  RequestShipmentStateManger(this._firstOptionService, this._markService, this._receiverService, this._unitService, this._harborService, this._subcontractService, this._containerSpecificationService);

 void getFirstOption(){
   _stateSubject.add(LoadingState());

   _firstOptionService.getWarehouse().then((warehouses) {
     if(warehouses == null ){
       _stateSubject.add(errorState('error connection'));
     }
     else{
       _firstOptionService.getCategories().then((categories) {
         if(categories == null ){
           _stateSubject.add(errorState('error connection'));
         }
         else {
           _stateSubject.add(FirstOptionFetchingDataState(categories: categories ,warehouses: warehouses));
         }
       });
     }
   });
 }

 void getSecondOption(String shippingWay ,bool isExternal){
   _stateSubject.add(LoadingState());
   _markService.getMyMarks().then((marks) {
     if(marks == null ){
       _stateSubject.add(errorState('error connection'));
     }
     else{
       _unitService.getUnits().then((units) {
         if(units != null){
           if(isExternal){
             _subcontractService.getSubcontracts().then((subcontracts) {
               if(subcontracts != null){
                 if(shippingWay == 'sea'){
                   _containerSpecificationService.getContainerSpecification().then((specifications) {
                     if(specifications != null){
                       HarborFilterRequest request = HarborFilterRequest(type: 'seaport');
                       _harborService.getHarbor(request).then((harbors){
                         if(harbors != null){
                           _stateSubject.add(SecondOptionFetchingDataState(marks: marks,units: units ,specifications: specifications,subContracts: subcontracts,harbors: harbors));
                         }
                       });
                     }
                   });
                 }else if(shippingWay == 'air') {
                   HarborFilterRequest request = HarborFilterRequest(type: 'airport');
                   _harborService.getHarbor(request).then((harbors){
                     if(harbors != null){
                       _stateSubject.add(SecondOptionFetchingDataState(marks: marks,units: units ,specifications: [],subContracts: subcontracts,harbors: harbors));
                     }
                   });
                 }
               }
             });
           }else{
             _stateSubject.add(SecondOptionFetchingDataState(marks: marks,units: units ,specifications: [],subContracts: [],harbors: []));
           }
         }else{
           _stateSubject.add(errorState('error connection'));
         }
       });
     }
   });

 }

 void getThirdOption(){
   _stateSubject.add(LoadingState());
   _receiverService.getMyReceiver().then((receivers) {
     if(receivers == null ){
       _stateSubject.add(errorState('error connection'));
     }
     else{
       _stateSubject.add(ThirdOptionFetchingDataState(receivers));
     }
   });
 }
}