import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_suppliers/manager/suppliers_manager.dart';
import 'package:pasco_shipping/module_suppliers/request/suppliers_request.dart';
import 'package:pasco_shipping/module_suppliers/response/suppliers_response.dart';


@injectable
  class SupplierService {
  final SupplierManager _manager;
  SupplierService(this._manager);

  Future<ConfirmResponse?> createSupplier(SupplierRequest request) {
    return _manager.createSupplier(request);
  }
  Future<ConfirmResponse?> updateSupplier(SupplierRequest request) {
    return _manager.updateSupplier(request);
  }
  Future<ConfirmResponse?> deleteSupplier(String id) {
    return _manager.deleteSupplier(id);
  }
  Future<List<SupplierModel>?> getSuppliers() {
    return _manager.getSuppliers();
  }
}