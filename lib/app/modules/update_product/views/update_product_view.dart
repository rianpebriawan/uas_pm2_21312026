import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_product_controller.dart';

class UpdateProductView extends GetView<UpdateProductController> {
  const UpdateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Data Mahasiswa'),
        leading: Image.asset(
            'assets/teknokrat.png'),
            backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Padding(
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
              onPressed: ()=> controller.updateProduct(
                controller.cNo_Mahasiwa.text,
                controller.cNama.text,
                controller.cProdi.text,
                Get.arguments,
              ), 
              child: Text("Ubah"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
              ),
              ),
          ],
        ),
        );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}
