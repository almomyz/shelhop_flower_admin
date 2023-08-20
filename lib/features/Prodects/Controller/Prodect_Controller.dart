import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shelhop_flower_admin/core/app_theme.dart';

class Prodect_Controller extends GetxController {
bool isloding=false;
  delete_Prodect(String id,String image,String  name)async {

   await FirebaseStorage.instance.refFromURL(image).delete().then((value) =>     FirebaseFirestore.instance.collection(name).doc(id).delete().then((value) {
      Get.back();
      Get.snackbar('حذف', 'تم حذف المنتج بنجاح', duration: Duration(seconds: 2),  isDismissible: true,backgroundColor: AppTheme.primaryColor,colorText: Colors.white,);

    })
    );

  }



  add_Prodect(String name,File image,String nameCategory) async{
     Get.dialog(
         barrierDismissible: false,
         Dialog(
       child: Container(
         height: 100,
         width: 50,
         child: Center(child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text('......  جاري اضافه منتج  ',style: TextStyle(color: AppTheme.primaryColor,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 15)),
             CircularProgressIndicator(),
           ],
         )),
       ),
     ));
var path=   await  FirebaseStorage.instance.ref(name).child(DateTime.now().toString()+basename(image.path).toString());
 await  path.putFile(image);
var url=await path.getDownloadURL();
  await  FirebaseFirestore.instance.collection(nameCategory).add({
         'name':name,
         'imgurl':url,
         'nameCategory':nameCategory,
         'entery_date' :DateTime.now().toString(),
         'id':15
         }).then((value) {
           isloding=true;
           Get.back();
           Get.back();
         Get.snackbar(
           'اضافه', 'تم اضافه القسم بنجاح', duration: Duration(seconds: 2),
           isDismissible: true,
           backgroundColor: AppTheme.primaryColor,
           colorText: Colors.white,);
         }
         );

     }

  }

