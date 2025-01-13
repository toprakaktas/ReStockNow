import 'package:cloud_firestore/cloud_firestore.dart';

class ItemService {
  final CollectionReference itemsCollection =
  FirebaseFirestore.instance.collection('items');

  Future<void> addItem(String itemUrl) {
    return itemsCollection.add({'url': itemUrl, 'inStock': false});
  }

  Stream<QuerySnapshot> getItems() {
    return itemsCollection.snapshots();
  }
}
