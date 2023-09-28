
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
 late TextEditingController cNama;
  late TextEditingController cNo_Mahasiwa;
  late TextEditingController cProdi;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async{
    DocumentReference docRef = firestore.collection("mahasiswa21312064").doc(id);

    return docRef.get();
  }

  void updateProduct(String no_mahasiswa, String nama, String prodi, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa21312064").doc(id);
    try {
      await productById.update({
        "no_mahasiswa" : no_mahasiswa,
        "nama_mahasiswa" : nama,
        "program_studi" : prodi,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Mahasiswa.",
        onConfirm: () {
          cNo_Mahasiwa.clear();
          cNama.clear();
          cProdi.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );

    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal Mengubah Product.",
      );
    }
  }

  @override
  void onInit(){
  cNo_Mahasiwa = TextEditingController();
  cNama=TextEditingController();
  cProdi=TextEditingController();
  super.onInit();
  }

  void onClose() {

    cNo_Mahasiwa.dispose();
    cNama.dispose();
    cProdi.dispose();
    super.onClose();
  }
}
