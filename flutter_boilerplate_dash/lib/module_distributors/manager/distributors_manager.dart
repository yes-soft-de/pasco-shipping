import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_distributors/repository/distributors_repository.dart';
import 'package:pasco_shipping/module_distributors/request/distributors_request.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class DistributorManager{
  final DistributorRepository _repository;
  DistributorManager(this._repository);

  Future<ConfirmResponse?> createDistributor(DistributorRequest request) => _repository.createDistributor(request);
  Future<ConfirmResponse?> deleteDistributor(String id) => _repository.deleteDistributor(id);
  Future<List<DistributorModel>?> getDistributors() => _repository.getDistributors();
  Future<ConfirmResponse?> updateDistributor(DistributorRequest request) => _repository.updateDistributor(request);


}