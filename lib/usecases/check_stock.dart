import 'package:restocknow/repository/item_repository.dart';

class CheckStockUseCase {
  final ItemRepository itemRepository;

  CheckStockUseCase(this.itemRepository);

  Future<bool> execute(String itemUrl) {
    return itemRepository.checkItemStock(itemUrl);
  }
}
