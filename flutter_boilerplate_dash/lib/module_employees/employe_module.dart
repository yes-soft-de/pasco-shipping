import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/abstracts/module/yes_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_employees/ui/screen/employees_screen.dart';
import 'package:pasco_shipping/module_employees/ui/screen/emplyee_new_screen.dart';

import 'employee_routes.dart';
import 'ui/screen/employee_update_role_screen.dart';
@injectable
class EmployeeModule extends YesModule {
  final EmployeesScreen _screen;
  final AddNewEmployee _addNewEmployee;
  final UpdateEmployeeRole _updateEmployeeRole;

  EmployeeModule(this._screen, this._addNewEmployee, this._updateEmployeeRole) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      EmployeeRoutes.VIEW_ALL: (context) => _screen,
      EmployeeRoutes.ADD_NEW: (context) => _addNewEmployee,
      EmployeeRoutes.UPDATE: (context) => _updateEmployeeRole,
    };
  }
}
