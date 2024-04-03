import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footware_admin/model/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // String test = 'test string';

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'un branded';
  bool offer = false;

  @override
  void onInit() {
    productCollection = firestore.collection('products');
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImgCtrl.text,
        offer: offer,
      );

      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product Added Successfully',
          colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  // testMethod() {
  //   print(test);
  // }

  setValuesDefault() {
    productNameCtrl.clear();
    productPriceCtrl.clear();
    productDescriptionCtrl.clear();
    productImgCtrl.clear();
    category = "general";
    brand = "un-branded";
    offer = false;
    update();
  }
}

//connect controller with UI page

//firebase - read the data from the firebase and list in the UI
// so create a list of products. This products we need to assign in the list,
// so create one list and type will be <product> becasue we are using a product
// then make one method - fetch products