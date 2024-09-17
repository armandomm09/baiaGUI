import 'package:baia_ui/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

const mainBlueColor = Color.fromARGB(255, 47, 82, 224);
const mainOrangeColor = Color.fromARGB(255, 246, 94, 65);
const mainYellowColor = Color.fromARGB(255, 249, 203, 65);
const mainGreyColor = Color.fromARGB(196, 158, 158, 158);

const hyperlinkTextStyle = TextStyle(
  decoration: TextDecoration.underline,
  color: Color.fromARGB(255, 0, 119, 255),
);

var myProductsList = [
  {"name": "Baia", "price": 9.00},
  {"name": "Tacos de canasta", "price": 5.00},
  {"name": "Hamburguesa de queso", "price": 39.00},
  {"name": "Hamburguesa hawaiana", "price": 49.00},
  {"name": "Agua de horchata", "price": 19.00},
  {"name": "Agua de jamaica", "price": 19.00}
];

var myAppBar = AppBar(
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hola,',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            "Negocio",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
              // Image.asset('assets/baiaClearBg.png', height: 100,)
              .animate()
              .fadeIn(),
        ],
      ),
      GestureDetector(
        child: const CircleAvatar(),
        onLongPress: () => AuthService().signOut(),
      )
    ],
  ),
);

const desgloseSellsJson = [
  {
    "id": 137,
    "name": "Carlos",
    "time": "3:45 p.m.",
    "date": "Hoy",
    "amount": 260.50
  },
  {
    "id": 136,
    "name": "Armando",
    "time": "3:43 p.m.",
    "date": "Ayer",
    "amount": 255.89
  },
  {
    "id": 135,
    "name": "Luis",
    "time": "4:10 p.m.",
    "date": "Hoy",
    "amount": 270.75
  },
  {
    "id": 134,
    "name": "Pedro",
    "time": "2:30 p.m.",
    "date": "Ayer",
    "amount": 249.99
  },
  {
    "id": 133,
    "name": "Maria",
    "time": "5:00 p.m.",
    "date": "Hoy",
    "amount": 265.40
  }
];

List horarioLista = [
    {
      "day": "Monday",
      "openHour": const TimeOfDay(hour: 9, minute: 0),
      "closeHour": const TimeOfDay(hour: 17, minute: 0),
    },
    {
      "day": "Tuesday",
      "openHour": const TimeOfDay(hour: 9, minute: 0),
      "closeHour": const TimeOfDay(hour: 17, minute: 0),
    },
    {
      "day": "Wednesday",
      "openHour": const TimeOfDay(hour: 9, minute: 0),
      "closeHour": const TimeOfDay(hour: 17, minute: 0),
    },
    {
      "day": "Thursday",
      "openHour": const TimeOfDay(hour: 9, minute: 0),
      "closeHour": const TimeOfDay(hour: 17, minute: 0),
    },
    {
      "day": "Friday",
      "openHour": const TimeOfDay(hour: 9, minute: 0),
      "closeHour": const TimeOfDay(hour: 17, minute: 0),
    },
    {
      "day": "Saturday",
      "openHour": const TimeOfDay(hour: 10, minute: 0),
      "closeHour": const TimeOfDay(hour: 14, minute: 0),
    },
    {
      "day": "Sunday",
      "openHour": const TimeOfDay(hour: 0, minute: 0),
      "closeHour": const TimeOfDay(hour: 0, minute: 0),
    },
  ];

final List<dynamic> ordersList = [
  {
    "name": "Pedro",
    "orderNumber": 23,
    "orderTotal": 327.45,
    "order": [
      {"quantity": 2, "name": "Hamburguesa con queso", "price": 118.00},
      {"quantity": 1, "name": "Hamburguesa hawaiana", "price": 75.00},
      {"quantity": 1, "name": "Agua de horchata", "price": 20.00},
      {"quantity": 1, "name": "Agua de jamaica", "price": 20.00}
    ]
  },
  {
    "name": "Armando",
    "orderNumber": 24,
    "orderTotal": 123.12,
    "order": [
      {"quantity": 3, "name": "Tacos al pastor", "price": 150.00},
      {"quantity": 2, "name": "Quesadilla de pollo", "price": 80.00},
      {"quantity": 1, "name": "Refresco de cola", "price": 25.00},
      {"quantity": 2, "name": "Agua de limón", "price": 30.00}
    ]
  },
  {
    "name": "Filip",
    "orderNumber": 25,
    "orderTotal": 543.21,
    "order": [
      {"quantity": 1, "name": "Ensalada César", "price": 70.00},
      {"quantity": 2, "name": "Sándwich de pavo", "price": 90.00},
      {"quantity": 3, "name": "Jugo de naranja", "price": 60.00},
      {"quantity": 1, "name": "Café americano", "price": 35.00}
    ]
  }
];


const orderExample = [
    {
        "ID": "8320ac64-73dd-4d9a-946a-aacc6d4c8ff1",
        "_id": "66bc0156d38d876c22e8abf5",
        "comments": "El sashimi que sea sin soya",
        "creationDate": 1723597142,
        "deliveryAddress": {
            "description": "Porton Gris",
            "number": 1411,
            "street": "Cda San Jose",
            "suburb": "Sta Cruz Buenavista"
        },
        "deliveryDate": 1723598942,
        "deliveryLocation": {
            "latitude": 19.0414,
            "longitude": 98.2063
        },
        "order": {
            "order": [
                {
                    "id": 10,
                    "quantity": 2,
                    "servicename": "Mochi",
                    "unitaryprice": 8
                },
                {
                    "id": 5,
                    "quantity": 2,
                    "servicename": "Yakitori",
                    "unitaryprice": 8
                }
            ]
        },
        "state": "active",
        "total": 8.3,
        "userID": ""
    },
    {
        "ID": "3084b769-641f-4e72-a249-8f893d986d4e",
        "_id": "66bc0290d337bb6c2cec6df2",
        "comments": "El sashimi que sea sin soya",
        "creationDate": 1723597456,
        "deliveryAddress": {
            "description": "Porton Gris",
            "number": 1411,
            "street": "Cda San Jose",
            "suburb": "Sta Cruz Buenavista"
        },
        "deliveryDate": 1723599256,
        "deliveryLocation": {
            "latitude": 19.0414,
            "longitude": 98.2063
        },
        "order": {
            "order": [
                {
                    "id": 2,
                    "quantity": 2,
                    "servicename": "Ramen de Tonkotsu",
                    "unitaryprice": 15
                }
            ]
        },
        "state": "active",
        "total": 4.23,
        "userID": ""
    },
    {
        "ID": "c7194db8-c3d0-4b65-9585-ed94d55701a6",
        "_id": "66bd79670f5cd7347805a2e9",
        "comments": "El sashimi que sea sin soya",
        "creationDate": 1723693415,
        "deliveryAddress": {
            "description": "Porton Gris",
            "number": 1411,
            "street": "Cda San Jose",
            "suburb": "Sta Cruz Buenavista"
        },
        "deliveryDate": 1723695215,
        "deliveryLocation": {
            "latitude": 19.0414,
            "longitude": 98.2063
        },
        "order": {
            "order": [
                {
                    "id": 4,
                    "quantity": 2,
                    "servicename": "Sushi Roll California",
                    "unitaryprice": 10
                },
                {
                    "id": 1,
                    "quantity": 2,
                    "servicename": "Sashimi de Salmón",
                    "unitaryprice": 18
                }
            ]
        },
        "state": "active",
        "total": 8.9,
        "userID": ""
    }
];