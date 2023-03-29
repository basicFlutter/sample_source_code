import 'package:equatable/equatable.dart';

import '../../data/models/inventory_model.dart';

class InventoryEntity extends Equatable {
  final String? id;
  final Vehicles? vehicles;
  final num? odometer;
  final String? stockNO;
  final String? createdAt;
  final num? isActive;
  final num? isDeleted;
  final num? sellPrice;
  final List<MidVdsMedia>? midVDSMedia;
  final num? odometerType;
  final num? specialPrice;
  final bool? isComingSoon;
  final num? vehicleStatus;
  final num? totalCost;
  final num? age;

  InventoryEntity(
      {this.id,
      this.vehicles,
      this.odometer,
      this.stockNO,
      this.createdAt,
      this.isActive,
      this.isDeleted,
      this.sellPrice,
      this.midVDSMedia,
      this.odometerType,
      this.specialPrice,
      this.isComingSoon,
      this.vehicleStatus,
      this.totalCost,
      this.age});

  @override
  List<Object?> get props => [
        id,
        vehicles,
        odometer,
        stockNO,
        createdAt,
        isActive,
        isDeleted,
        sellPrice,
        midVDSMedia,
        odometerType,
        specialPrice,
        isComingSoon,
        vehicleStatus,
        totalCost,
        age
      ];
}
