import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_suppliers/repository/suppliers_repository.dart';
import 'package:pasco_shipping/module_suppliers/request/suppliers_request.dart';
import 'package:pasco_shipping/module_suppliers/response/suppliers_response.dart';

@injectable
class SupplierManager{
  final SupplierRepository _repository;
  SupplierManager(this._repository);

  Future<ConfirmResponse?> createSupplier(SupplierRequest request) => _repository.createSupplier(request);
  Future<ConfirmResponse?> deleteSupplier(String id) => _repository.deleteSupplier(id);
  Future<List<SupplierModel>?> getSuppliers() => _repository.getSuppliers();
  Future<ConfirmResponse?> updateSupplier(SupplierRequest request) => _repository.updateSupplier(request);


}