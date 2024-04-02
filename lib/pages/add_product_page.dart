// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:footware_admin/controller/home_controller.dart';
import 'package:footware_admin/widgets/dropdown_button.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddproductPage extends StatelessWidget {
  const AddproductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (ctrl) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Add Product"),
              backgroundColor: Colors.deepOrange,
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Add New Product",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold)),
                    TextField(
                      controller: ctrl.productNameCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text("Product Name"),
                          hintText: "Enter Your Product Name"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: ctrl.productDescriptionCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text("Product Description"),
                          hintText: "Enter Your Product Description"),
                      maxLines: 4,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: ctrl.productImgCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text("Image URL"),
                          hintText: "Enter Your Image URL"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: ctrl.productPriceCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: Text("Product Price"),
                          hintText: "Enter Your Product Price"),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                            child: DropDownBtn(
                          items: ['Cafe1', 'Cafe2', 'Cafe3'],
                          selectedItemText: 'Category',
                          onSelected: (selectedValue) {
                            print(selectedValue);
                          },
                        )),
                        Flexible(
                            child: DropDownBtn(
                          items: ['Brand1', 'Brand2', 'Brand3'],
                          selectedItemText: 'Brand',
                          onSelected: (selectedValue) {
                            print(selectedValue);
                          },
                        )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Offer Product ?"),
                    SizedBox(height: 10),
                    DropDownBtn(
                      items: ['true', 'false'],
                      selectedItemText: "Offer ?",
                      onSelected: (selectedValue) {
                        print(selectedValue);
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          ctrl.addProduct();
                        },
                        child: Text("Add Product")),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
     
