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
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Title"),
                    subtitle: Text("Price: 100"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
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
