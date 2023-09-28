import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Mahasiswa'),
        centerTitle: true,
        leading: Image.asset(
            'assets/teknokrat.png'),
            backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNo_Mahasiwa,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "No Mahasiswa"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama Mahasiswa"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.cProdi,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Program Studi"),
            ),
             SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: ()=> controller.addProduct(
                controller.cNo_Mahasiwa.text,
                controller.cNama.text,
                controller.cProdi.text,
              ), 
              child: Text("Simpan"),
               style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
              ),
              ),
          ],
        ),
        ),
    );
  }
}
