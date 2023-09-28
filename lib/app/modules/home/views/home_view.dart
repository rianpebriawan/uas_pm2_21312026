import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
               Get.back();
              Get.toNamed(
                Routes.UPDATE_PRODUCT,
              arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.deleteProduct(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset(
            'assets/teknokrat.png'),
          title: const Text('Data Mahasiswa'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: () => cAuth.logout(),
              icon: Icon(Icons.logout),
            )
          ]),
      body: StreamBuilder<QuerySnapshot<Object?>>( 
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // mengambil data
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                  backgroundColor: Colors.white,
                ),
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["nama_mahasiswa"]}"),
                subtitle: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["no_mahasiswa"]}"),
                trailing: IconButton(
                  onPressed: () => showOption(listAllDocs[index].id),
                  icon: Icon(Icons.more_vert),
                    ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
      child: Icon(Icons.add), backgroundColor: Colors.blue,),
    );
  }
}
