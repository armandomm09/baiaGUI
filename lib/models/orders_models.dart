class Platillo {
  final int id;
  final String serviceName;
  final double unitaryPrice;
  final int quantity;

  Platillo({
    required this.id,
    required this.serviceName,
    required this.unitaryPrice,
    required this.quantity,
  });

  factory Platillo.fromJson(Map<String, dynamic> json) {
    return Platillo(
      id: json['id'],
      serviceName: json['serviceName'],
      unitaryPrice: json['unitaryPrice'],
      quantity: json['quantity'],
    );
  }
}

class Order {
  final List<Platillo> orden;

  Order({
    required this.orden,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var list = json['orden'] as List;
    List<Platillo> platilloList = list.map((i) => Platillo.fromJson(i)).toList();

    return Order(
      orden: platilloList,
    );
  }
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class Address {
  final String street;
  final int number;
  final String suburb;
  final String description;

  Address({
    required this.street,
    required this.number,
    required this.suburb,
    required this.description,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      number: json['number'],
      suburb: json['suburb'],
      description: json['description'],
    );
  }
}

class FinalOrder {
  final String id;
  final String userID;
  final int creationDate;
  final String state;
  final Order order;
  final double total;
  final Location deliveryLocation;
  final Address deliveryAddress;
  final int deliveryDate;
  final String comments;

  FinalOrder({
    required this.id,
    required this.userID,
    required this.creationDate,
    required this.state,
    required this.order,
    required this.total,
    required this.deliveryLocation,
    required this.deliveryAddress,
    required this.deliveryDate,
    required this.comments,
  });

  factory FinalOrder.fromJson(Map<String, dynamic> json) {
    return FinalOrder(
      id: json['ID'],
      userID: json['userID'],
      creationDate: json['creationDate'],
      state: json['state'],
      order: Order.fromJson(json['order']),
      total: json['total'].toDouble(),
      deliveryLocation: Location.fromJson(json['deliveryLocation']),
      deliveryAddress: Address.fromJson(json['deliveryAddress']),
      deliveryDate: json['deliveryDate'],
      comments: json['comments'],
    );
  }
}
