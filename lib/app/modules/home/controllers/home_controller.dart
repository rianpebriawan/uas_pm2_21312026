import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Stream<QuerySnapshot<Object?>> streamData(){
    CollectionReference products = firestore.collection('mahasiswa21312064');
    return products.snapshots();
  }

  void deleteProduct(String id){
    DocumentReference docRef = firestore.collection("mahasiswa21312064").doc(id);

    try{
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }
}
