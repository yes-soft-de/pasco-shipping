
class StatisticResponse{
  StatisticResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  StatisticModel? data;

  factory StatisticResponse.fromJson(Map<String, dynamic> json) => StatisticResponse(
    statusCode: json["status_code"],
    msg: json["msg"],
    data: StatisticModel.fromJson(json["Data"]),
  );

}

class StatisticModel {
  StatisticModel({
    this.orders,
    this.travels,
    this.users,
  });

  Orders? orders;
  Travels? travels;
  Users? users;

  factory StatisticModel.fromJson(Map<String, dynamic> json) => StatisticModel(
    orders: Orders.fromJson(json["orders"]),
    travels: Travels.fromJson(json["travels"]),
    users: Users.fromJson(json["users"]),
  );

}

class Orders {
  Orders({
    this.total,
    this.waitingOrders,
    this.acceptedOrders,
  });

  int? total;
  int? waitingOrders;
  int? acceptedOrders;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    total: json["total"],
    waitingOrders: json["waitingOrders"],
    acceptedOrders: json["acceptedOrders"],
  );
}

class Travels {
  Travels({
    this.total,
    this.flight,
    this.cruise,
  });

  int? total;
  Cruise? flight;
  Cruise? cruise;

  factory Travels.fromJson(Map<String, dynamic> json) => Travels(
    total: json["total"],
    flight: Cruise.fromJson(json["flight"]),
    cruise: Cruise.fromJson(json["cruise"]),
  );

}

class Cruise {
  Cruise({
    this.total,
    this.current,
    this.started,
    this.arrived,
  });

  int? total;
  int? current;
  int? started;
  int? arrived;

  factory Cruise.fromJson(Map<String, dynamic> json) => Cruise(
    total: json["total"],
    current: json["current"],
    started: json["started"],
    arrived: json["released"],
  );


}

class Users {
  Users({
    this.customers,
    this.employees,
    this.totals,
  });

  int? customers;
  int? employees;
  int? totals;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    customers: json['customers'],
    employees: json['employees'],
    totals: json['totals'],
  );

}
