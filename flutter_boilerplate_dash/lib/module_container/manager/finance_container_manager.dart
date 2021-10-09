import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_container/repository/finance_container_repository.dart';
import 'package:pasco_shipping/module_container/request/conatiner_filter_finance_request.dart';
import 'package:pasco_shipping/module_container/request/container_add_finance_request.dart';
import 'package:pasco_shipping/module_container/response/container_finance_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class FinanceContainerManager{
  final FinanceContainerRepository _repository;
  FinanceContainerManager(this._repository);

  Future<Data?> getContainerFCLFinance(ContainerFilterFinanceRequest request) => _repository.getContainerFCLFinance(request);
  Future<Data?> getContainerLCLFinance(ContainerFilterFinanceRequest request) => _repository.getContainerLCLFinance(request);
  Future<ConfirmResponse?> createContainerFCLFinance(ContainerAddFinanceRequest request) => _repository.createContainerFCLFinance(request);
  Future<ConfirmResponse?> createContainerLCLFinance(ContainerAddFinanceRequest request) => _repository.createContainerLCLFinance(request);

}