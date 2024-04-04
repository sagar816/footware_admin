import 'package:flutter/material.dart';
import 'package:footware_admin/controller/home_controller.dart';
// import 'package:footware_admin/controller/home_controller.dart';
import 'package:footware_admin/pages/add_product_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (ctrl) {
          return Scaffold(
            appBar: AppBar(
              title: Center(child: const Text("Footwears Admin")),
              backgroundColor: Colors.deepOrange,
            ),
            body: ListView.builder(
                itemCount: ctrl.products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(ctrl.products[index].name ?? ''),
                    subtitle:
                        Text((ctrl.products[index].price ?? 0).toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ctrl.deleteProduct(ctrl.products[index].id ?? '');
                        // ctrl.testMethod();
                        // ctrl.test;
                        // print("Delete");
                      },
                    ),
                  );
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(() => AddproductPage());
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.deepOrange,
            ),
          );
        });
  }
}
