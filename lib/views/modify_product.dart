import 'dart:io';

import 'package:ecommerce_admin_app/controllers/cloudinary_service.dart';
import 'package:ecommerce_admin_app/controllers/db_service.dart';
import 'package:ecommerce_admin_app/controllers/storage_service.dart';
import 'package:ecommerce_admin_app/models/products_model.dart';
import 'package:ecommerce_admin_app/providers/admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ModifyProduct extends StatefulWidget{
  const ModifyProduct({super.key});

  @override
  State<ModifyProduct> createState() => _ModifyProductState();
}

class _ModifyProductState extends State<ModifyProduct> {
  late String productId = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController oldPriceController = TextEditingController();
  TextEditingController newPriceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  late XFile? image = null;

  // NEW : upload to cloudinary
  void _pickImageAndCloudinaryUpload() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image !=null){
      String? res = await uploadToCloudinary((image);
      setState(() {
        if (res !=null) {
          imageController.text = res;
          print("set image url ${res} : ${imageController.text}");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text ("Image uploaded sucessfully")));
        }
      });
    }
  }


















// set the data from arguments
setData(ProductsModel data) {
  productId = data.id;
  nameController.text = data.name;
  oldPriceController.text = data.old_price.toString();
  newPriceController.text = data.new_price.toString();
  quantityController.text = data.maxQuantity.toString();
  categoryController.text = data.category;
  descController.text = data.description;
  imageController.text= data.image;
  setState(() {});
}

@override
Widget build(BuildContext context) {
  final arguments = ModalRoute.of(context)!.settings.arguments;
  if (arguments !=null && arguments is ProductsModel) {
    setData(arguments);
  }
  return Scaffold(
    appBar: AppBar(
      title: Text(productId.isNotEmpty ? "Update Product" : "Add Product"),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInset,.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (v) => v!.isEmpty ? "This cant be empty." : null,
                decoration: InputDecoration(
                  hintText: "Product Name",
                  label: Text("Produt Name"),
                  fillColor: Colors.deepPurple.shade50,
                  filled: true),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: oldPriceController,
                validator: (v) => v!.isEmpty ? "This cant be empty." : null,
                decoration: InputDecoration(
                  hintText: "Original Price",
                  label: Text("Original Price"),
                  fillColor: Colors.deepPurple.shade50,
                  filled: true,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: newPriceController,
                validator: (v) => v!.isEmpty ? "This cant be empty." :null,
                decoration: InputDecoration(
                  hintText: "Sell Price",
                  label: Text("Sell Price"),
                  fillColor: Colors.deepPurple.shade50,
                  filled: true,
                ),
                keyboardType: TextInputType.number,
              ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: quantityController,
                  validator: (v) => v!.isEmpty ? "This cant be empty." : null,
                  decoration: InputDecoration(
                    hintText: "Quantity Left",
                    label: Text("Quantity Left"),
                    fillColor: Colors.deepPurple.shade50,
                    filled: true),
                ),
                SizedBox(
                  height: 10,
                ),
                
              )










            ],
          )
        )
      ),
    )
  )
}
}
