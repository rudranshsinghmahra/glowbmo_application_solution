import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  CollectionReference myGrids =
      FirebaseFirestore.instance.collection('myGrids');

  Future addGridsToDatabase(String gridName) async {
    myGrids.doc().set({
      "gridName": gridName,
    });
  }

  Future deletedGridFromDatabase(gridId) async {
    myGrids.doc(gridId).delete();
  }
}
