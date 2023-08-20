
import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shelhop_flower_admin/core/app_theme.dart';
import 'package:shelhop_flower_admin/core/util/ScreenUtil.dart';
import 'package:shelhop_flower_admin/features/Prodects/Controller/Prodect_Controller.dart';

class Prodects_Page extends StatefulWidget {
   String name;
   Prodects_Page({Key? key, required this.name}) : super(key: key);

  @override
  State<Prodects_Page> createState() => _Prodects_PageState();
}

class _Prodects_PageState extends State<Prodects_Page> {
  ScreenUtil screenUtil =ScreenUtil();
  TextEditingController name = TextEditingController();
  var image;
  var imgname;
  var urlimg;
  late File? file = image;
  var imgPicker = ImagePicker();
  var setStatestuflu;
  final formKey = GlobalKey<FormState>();

  final prodectController = Get.put(Prodect_Controller());

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
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

                                      Text('اضافه منتج',style: AppTheme.textTheme.headline6,),

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
                                                    Text('اضافه صوره للمنتج',style:TextStyle(color: Colors.black,  fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 15)),
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
                                                return 'ادخل اسم المنتج';
                                              }
                                              return null;
                                            },
                                            controller: name,
                                            style: TextStyle(color: AppTheme.primaryColor,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 15),
                                            decoration: InputDecoration(
                                                hintText: 'اسم المنتج',
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
                                                await  prodectController.add_Prodect(name.text, file!, widget.name.toString());

                                              }

                                              else{

                                                Get.snackbar('خطاء', 'يرجي اختيار صورة المنتج ',  duration: Duration(seconds: 2),  isDismissible: true,backgroundColor: AppTheme.primaryColor,colorText: Colors.white,);
                                              }
                                              if(prodectController.isloding==true){
                                                file=null;
                                                name.text='';
                                                setStatestuflu(() {
                                                  file=null;
                                                  name.text='';

                                                });


                                                prodectController.isloding=false;
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
        Text('اضافه منتج ',style: TextStyle(color: Colors.white,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 18))
      ]),)),
      appBar: AppBar(backgroundColor: AppTheme.primaryColor,title: Center(child: Text('${widget.name}',style: AppTheme.textTheme.headline2,))),
      body: StreamBuilder<QuerySnapshot>(
        stream:   FirebaseFirestore.instance.collection(widget.name.toString()).snapshots(),
        builder:  (context, snapshot) {
        return  Column(
          children: [
              Expanded(child: Center(child: Text('اظغط على المنتج بشكل مطول  من اجل الحذف',style: AppTheme.textTheme.bodyText1,))),
              Container(
                height:          screenUtil.screenHeight *.8,
                width:           double.infinity,
                child: GridView.builder(
                  itemCount:  snapshot.data!.docs.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 50,crossAxisSpacing: 20,), itemBuilder: (context, index) {
                  return InkWell(
                      onLongPress: (){
                        Get.defaultDialog(titleStyle: AppTheme.textTheme.headline6,buttonColor: AppTheme.primaryColor,middleTextStyle: AppTheme.textTheme.headline5,title: 'حذف منتج',middleText: 'هل تريد حذف هذا المنتج؟',textConfirm: 'نعم',textCancel: 'لا',onConfirm: (){
                          prodectController.delete_Prodect(snapshot.data!.docs[index].id,snapshot.data!.docs[index]['imgurl'],snapshot.data!.docs[index]['nameCategory']);
                        },onCancel: (){

                        },confirmTextColor: Colors.white,barrierDismissible: false,);
                      },
                    child: Column(children: [

                      Expanded(
                        flex: 4,
                        child: Container(
                          height:   double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: AppTheme.primaryColor),

                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              snapshot.data!.docs[index]['imgurl'],
                              fit:  BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        snapshot.data!.docs[index]['name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppTheme.fontFamily,
                          color:  AppTheme.secondaryColor

                        )
                      )


                    ],),
                  );
                }),
              ),

          ],
        );
        }
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
