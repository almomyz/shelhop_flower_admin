
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:shelhop_flower_admin/core/app_theme.dart';
import 'package:shelhop_flower_admin/core/util/ScreenUtil.dart';
import 'package:shelhop_flower_admin/features/Categories/Controller/Categories_Controller.dart';

class Categories_Card extends StatefulWidget {
  String image;
  String name;
  final ontap;
  String id;
   Categories_Card({Key? key,required this.ontap,required this.name,required this.image,required this.id}) : super(key: key);

  @override
  State<Categories_Card> createState() => _Categories_CardState();
}

class _Categories_CardState extends State<Categories_Card> {
 ScreenUtil screenUtil =ScreenUtil();
 final CategriesController = Get.put(Categories_Controller());

 @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Container(

      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      height: screenUtil.screenHeight *.2,
      width: double.infinity,
      child: Card(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
          Container(
              height: double.infinity,
               width: screenUtil.screenWidth *.4,
              child: ClipRRect(
                  borderRadius:  BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  child: Image.network(widget.image,fit: BoxFit.cover,))),
          Expanded(
              flex: 6,
              child: Center(child: Text(widget.name,style: AppTheme.textTheme.headline6,textDirection: TextDirection.rtl,))),
          Expanded
            (
                flex: 2,
              child: IconButton(onPressed: (){
                Get.defaultDialog(titleStyle: AppTheme.textTheme.headline6,buttonColor: AppTheme.primaryColor,middleTextStyle: AppTheme.textTheme.headline5,title: 'حذف قسم',middleText: 'هل تريد حذف هذا القسم؟',textConfirm: 'نعم',textCancel: 'لا',onConfirm: (){
                  CategriesController.delete_Category(widget.id,widget.image);
                },onCancel: (){

                },confirmTextColor: Colors.white,barrierDismissible: false,);
              }, icon: Icon(Icons.delete,color: AppTheme.primaryColor,))),
        ]),
      ),
    );
  }
}
