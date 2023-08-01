import 'package:dartz/dartz.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/use_case/base_use_case.dart';
import 'package:new_panel/features/inventory_page/domain/repositories/inventory_repository.dart';



import '../entities/inventory_entity.dart';

class GetInventoryUseCase extends BaseUseCase<List<InventoryEntity> , String  > {

  InventoryRepository inventoryRepository ;


  GetInventoryUseCase({required this.inventoryRepository});

  @override
  Future<Either<ResponseError, List<InventoryEntity>>> call(String  params) {
    return inventoryRepository.getInventories(stateType: params ) ;
  }

}