import 'package:restocknow/services/stock_service.dart';

class ItemRepository {
  final StockService stockService;

  ItemRepository(this.stockService);

  Future<bool> checkItemStock(String itemUrl) {
    return stockService.checkItemStock(itemUrl);
  }
}
