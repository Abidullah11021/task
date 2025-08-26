import 'package:flutter/material.dart';
import 'package:task/features/home/presentation/model/item_model.dart';
import 'package:task/gen/assets.gen.dart';

class HomeProvider extends ChangeNotifier {
  final List<ItemModel> items = [
    ItemModel(
      id: 1,
      image: Assets.pngs.a1.path,
      title: "Red Komodo 6K",
      location: "Milano, Lombardia, Italia",
      price: "250€ / giorno",
      status: "Disponibile Adesso",
      statusColor: Colors.green,
    ),
    ItemModel(
      id: 2,
      image: Assets.pngs.a2.path,
      title: "BlackMagic 6K Pro",
      location: "Milano, Lombardia, Italia",
      price: "130€ / giorno",
      status: "Disponibile fra 4 giorni",
      statusColor: Colors.orange,
    ),
    ItemModel(
      id: 3,
      image: Assets.pngs.a3.path,
      title: "18 – 35 Sigma Lens",
      location: "Milano, Lombardia, Italia",
      price: "40€ / giorno",
      status: "Disponibile Adesso",
      statusColor: Colors.green,
    ),
    ItemModel(
      id: 4,
      image: Assets.pngs.a4.path,
      title: "DJI Ronin RS3 PRO",
      location: "Milano, Lombardia, Italia",
      price: "60€ / giorno",
      status: "Disponibile Adesso",
      statusColor: Colors.green,
    ),
    ItemModel(
      id: 5,
      image: Assets.pngs.a5.path,
      title: "Sony FX3",
      location: "Milano, Lombardia, Italia",
      price: "300€ / giorno",
      status: "Disponibile Adesso",
      statusColor: Colors.green,
    ),
    ItemModel(
      id: 6,
      image: Assets.pngs.a6.path,
      title: "Apple Mac Studio",
      location: "Milano, Lombardia, Italia",
      price: "230€ / giorno",
      status: "Disponibile Adesso",
      statusColor: Colors.green,
    ),
  ];
}
