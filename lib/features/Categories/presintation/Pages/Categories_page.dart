
import 'dart:io';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shelhop_flower_admin/core/app_theme.dart';
import 'package:shelhop_flower_admin/core/util/ScreenUtil.dart';
import 'package:shelhop_flower_admin/features/Categories/Controller/Categories_Controller.dart';
import 'package:shelhop_flower_admin/features/Categories/presintation/Widgets/Categories_Card.dart';

class Categories_page extends StatefulWidget {
  const Categories_page({Key? key}) : super(key: key);

  @override
  State<Categories_page> createState() => _Categories_pageState();
}

class _Categories_pageState extends State<Categories_page> {
  @override
  ScreenUtil screenUtil =ScreenUtil();
  var image;
  var imgname;
  var urlimg;
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  late File? file = image;
  var imgPicker = ImagePicker();
  final CategriesController = Get.put(Categories_Controller());
  var setStatestuflu;
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return  Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.primaryColor,title: Center(child: Text('الاقسام',style: AppTheme.textTheme.headline2,))),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Get.dialog(
          barrierColor: Colors.black.withOpacity(0.5),
          StatefulBuilder(
            builder: (context2, setState2) {
              setStatestuflu=setState2;
              return  SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
                  child: Center(
                    child: Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Form(
                          key:  formKey,
                          child: Container(
                              height: screenUtil.screenHeight *.7,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    Text('اضافه قسم',style: AppTheme.textTheme.headline6,),

                                    Container(
                                      height: screenUtil.screenHeight *.3,
                                      width: screenUtil.screenWidth *.8,
                                      child: InkWell(
                                          onTap: () {

                                   selectimg();


                                          },
                                          child: file == null
                                              ? image = Center(
                                            child: Container(
                                              height:   screenUtil.screenHeight *.3,
                                              width:   screenUtil.screenWidth *.8,
                                              decoration: BoxDecoration(
                                                  borderRadius:   BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: AppTheme.primaryColor,
                                                      width: 2
                                                  )
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text('اضافه صوره للقسم',style:TextStyle(color: Colors.black,  fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 15)),
                                                  Icon(
                                                    Icons.add_photo_alternate_outlined,
                                                    color: AppTheme.primaryColor,
                                                    size: 30,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                              : Container(
                                            height:   screenUtil.screenHeight *.3,
                                            width:   screenUtil.screenWidth *.8,
                                            decoration: BoxDecoration(
                                                borderRadius:   BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: AppTheme.primaryColor,
                                                    width: 2
                                                )
                                            ),
                                                child: ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                            child: Image.file(
                                                file!,
                                                fit: BoxFit.cover,
                                            ),
                                          ),
                                              )),
                                    ),

                                    Container(
                                      padding:  EdgeInsets.all(15),
                                      child: TextFormField(
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return 'ادخل اسم القسم';
                                          }
                                          return null;
                                        },
                                              controller: name,
                                          style: TextStyle(color: AppTheme.primaryColor,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 15),
                                          decoration: InputDecoration(
                                              hintText: 'اسم القسم',
                                              hintStyle: TextStyle(fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 15),
                                              fillColor: Colors.grey.shade200,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),

                                              )
                                          )),
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),),onPressed: (){
                                            Get.back();
                                          }, child: Text('الغاء',style: TextStyle(color: AppTheme.primaryColor,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 12))),
                                          SizedBox(width: 20,),
                                          ElevatedButton(onPressed: ()async{
                                            if(formKey.currentState!.validate()&& file != null){
                                            await  CategriesController.add_Category(name.text, file!);

                                            }

                                            else{

                                                Get.snackbar('خطاء', 'يرجي اختيار صورة القسم ',  duration: Duration(seconds: 2),  isDismissible: true,backgroundColor: AppTheme.primaryColor,colorText: Colors.white,);
                                            }
                                            if(CategriesController.isloding==true){
                                              file=null;
                                              name.text='';
                                              setStatestuflu(() {
                                                file=null;
                                                name.text='';

                                              });


                                              CategriesController.isloding=false;
                                            }

                                          }, child: Text('حفظ',style: TextStyle(color: Colors.white,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 12))),

                                        ])
                                  ]
                              )
                          ),
                        )
                    ),
                  ),
                ),
              );
            },
          )
        );

      }, label: Container( child: Row(children: [
        Icon(Icons.add,size: 25),
        SizedBox(width: 10,),
        Text('اضافه قسم ',style: TextStyle(color: Colors.white,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 18))
      ]),)),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('الاقسام').snapshots(),
        builder: (context, snapshot) {
       return  ListView.builder(
         itemCount: snapshot.data!.docs.length,
         itemBuilder: (context, index) {
           return Categories_Card(ontap: (){

           }, name: snapshot.data!.docs[index]['name'],image: snapshot.data!.docs[index]['image'],id: snapshot.data!.docs[index].id,);
         },) ;
      },
      ),
    );
  }

  selectimg() async {
    var imgpiced = await imgPicker.getImage(source: ImageSource.gallery);
    if (imgpiced != null) {
      setStatestuflu(() {
        file = File(imgpiced.path);
        imgname = basename(imgpiced.path);
      });
    } else {
          Get.snackbar('حاول مجددا', 'يرجي اختيار صورة',  duration: Duration(seconds: 2),  isDismissible: true,backgroundColor: AppTheme.primaryColor,colorText: Colors.white,);
    }
  }

}
