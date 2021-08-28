// enum EmployeeRole {
//   ADMIN_DATA_ENTRY,
//   ADMIN_REPORT,
//   ADMIN_SUBCONTRACT,
//   RECEIVING_EMP,
//   ARRIVING_EMP,
//   ACCOUNTANT
// }
// List<String> EmployeeRole = ['AdminEntry',
//   'ADMIN_REPORT',
//   'ADMIN_SUBCONTRACT',
//   'RECEIVING_EMP',
//   'ARRIVING_EMP',
//   'ACCOUNTANT'];
class ConstVar{
  static List<String> Roles = [];
}

const Map<String, List<String>> EmployeeRoleName = {
  'Admin Data Entry': ['ROLE_DATA_MAINTAINANCE'],
  'Admin Report': [
    'ROLE_ALL_REPORT_READ',
        'ROLE_ALL_SHIPMENT_READ',
        'ROLE_ALL_CONTAINER_READ',
        'ROLE_ALL_AIRWAYBILL_READ',
        'ROLE_ALL_TRAVEL_READ',
  ],
  'Admin SubContract': [
    'ROLE_HOLDER_REQUEST',
        'ROLE_HOLDER_READ',
  ],
  'Receiving Employee': [
    'ROLE_WAITING_UPDATE_STATE',
        'ROLE_ACCEPTED_UPDATE_STATE',
        'ROLE_HOLDER_REQUEST',
  ],
  'Arriving Employee': ['ROLE_ARRIVED_UPDATE_STATE'],
  'Accountant': [
    'ROLE_ALL_FINANCE_CREATE',
        'ROLE_ALL_FINANCE_READ',
  ],
  'Super Admin': ['ROLE_EMPLOYEE'],
  'HR employee':['ROLE_EMPLOYEE_CREATE',
    'ROLE_EMPLOYEE_READ'
  ]
};
