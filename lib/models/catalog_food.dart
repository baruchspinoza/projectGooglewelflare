// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
class CatalogModel {
  static List<Item> foodList = [
    Item(0, 'Sea Foods', 'graphic/seafoods.jpg', 10),
    Item(1, 'Rice', 'graphic/rice.jpeg', 5),
    Item(2, 'Banana', 'graphic/banana.jpg', 2),
    Item(3, 'Apple', 'graphic/apple.jpg', 1),
    Item(4, 'Mango', 'graphic/mango.jpeg', 3),
    Item(5, 'Tomato', 'graphic/tomato.jpg', 2),
    Item(6, 'Onion', 'graphic/onion.jpg', 1),
  ];

  static List<Item> healthList = [
    Item(0, 'Drugs', 'graphic/drugs.jpg', 10),
    Item(1, 'Vaccine', 'graphic/vac.jpg', 15),
    Item(2, 'Aid Kit', 'graphic/aid.jpg', 50),
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getFoodById(int id) => foodList.firstWhere((item) => item.id == id);

  /// Get item by its position in the catalog.
  Item getFoodByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getFoodById(position);
  }

  Item getHealthById(int id) => healthList.firstWhere((item) => item.id == id);

  /// Get item by its position in the catalog.
  Item getHealthByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getHealthById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final String imageUrl;
  final int price;

  Item(this.id, this.name, this.imageUrl, this.price);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
