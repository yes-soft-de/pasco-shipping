import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/manager/finance_container_manager.dart';
import 'package:pasco_shipping/module_container/request/conatiner_filter_finance_request.dart';
import 'package:pasco_shipping/module_container/request/container_add_finance_request.dart';
import 'package:pasco_shipping/module_container/response/container_finance_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class FinanceContainerService {
  final FinanceContainerManager _manager;
  FinanceContainerService(this._manager);


  Future<ConfirmResponse?> createContainerFCLFinance(ContainerAddFinanceRequest request) {
    return _manager.createContainerFCLFinance(request);
  }
  Future<ConfirmResponse?> createContainerLCLFinance(ContainerAddFinanceRequest request) {
    return _manager.createContainerLCLFinance(request);
  }
  Future<Data?> getContainerLCLFinance(ContainerFilterFinanceRequest request) {
    return _manager.getContainerLCLFinance(request);
  }
  Future<Data?> getContainerFCLFinance(ContainerFilterFinanceRequest request) {
    return _manager.getContainerFCLFinance(request);
  }
}