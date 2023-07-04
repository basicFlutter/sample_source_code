import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/inventory_page/domain/repositories/inventory_repository.dart';



import '../entities/inventory_entity.dart';

class GetWholeInventoryUseCase extends BaseUseCase<List<InventoryEntity> , Map  > {

  InventoryRepository inventoryRepository ;


  GetWholeInventoryUseCase({required this.inventoryRepository});

  @override
  Future<Either<Failure, List<InventoryEntity>>> call(params) {
    return inventoryRepository.getWholeInventories() ;
  }

}