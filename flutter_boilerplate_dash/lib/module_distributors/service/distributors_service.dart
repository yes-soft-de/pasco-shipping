import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_distributors/manager/distributors_manager.dart';
import 'package:pasco_shipping/module_distributors/request/distributors_request.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';


@injectable
  class DistributorService {
  final DistributorManager _manager;
  DistributorService(this._manager);

  Future<ConfirmResponse?> createDistributor(DistributorRequest request) {
    return _manager.createDistributor(request);
  }
  Future<ConfirmResponse?> updateDistributor(DistributorRequest request) {
    return _manager.updateDistributor(request);
  }
  Future<ConfirmResponse?> deleteDistributor(String id) {
    return _manager.deleteDistributor(id);
  }
  Future<List<DistributorModel>?> getDistributors() {
    return _manager.getDistributors();
  }
}