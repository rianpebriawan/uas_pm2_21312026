import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {

  late TextEditingController cNama;
  late TextEditingController cNo_Mahasiwa;
  late TextEditingController cProdi;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String no_mahasiswa, String nama, String prodi) async{
    CollectionReference products = firestore.collection('mahasiswa21312064');

    try{
      await products.add({
        "no_mahasiswa" : no_mahasiswa,
        "nama_mahasiswa" : nama,
        "program_studi" : prodi,
        });
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data product",
          onConfirm: () {
            cNo_Mahasiwa.clear();
            cNama.clear();
            cProdi.clear();
            Get.back();
            Get.back();
            textConfirm: "OK";
          }
        );
    }catch(e){
      
        print(e);
        Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal Menambahkan Product.",
        );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
  cNo_Mahasiwa = TextEditingController();
  cNama=TextEditingController();
  cProdi=TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNo_Mahasiwa.dispose();
    cNama.dispose();
    cProdi.dispose();

    super.onClose();
  }
}
