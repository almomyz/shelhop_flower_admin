
import 'package:flutter/material.dart';
import 'package:shelhop_flower_admin/core/app_theme.dart';
import 'package:shelhop_flower_admin/core/widgets/CustomPageRoute.dart';
import 'package:shelhop_flower_admin/features/Admins/presintation/Pages/Admins_page.dart';
import 'package:shelhop_flower_admin/features/Categories/presintation/Pages/Categories_page.dart';
import 'package:shelhop_flower_admin/features/Orders/presintation/Pages/Orders_page.dart';
import 'package:shelhop_flower_admin/features/Prodects/presintation/Pages/Prodect_Categories_page.dart';

import '../Widgets/Card_Home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: AppTheme.primaryColor,title: Center(child: Text('القائمة الرئسية',style: AppTheme.textTheme.headline2,))),
        body: Column(

          children: [
            SizedBox(height: 20,),
            Expanded(
                flex: 3,
                child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [

                  Image.asset('assets/images/admin.png',height: double.infinity,width: double.infinity,fit: BoxFit.contain,),
                  Text('...   مرحبا مدير ',style: AppTheme.textTheme.bodyText1),


                ])),
            SizedBox(height: 20,),
            Expanded(
              flex: 6,

              child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 30,crossAxisSpacing: 10),children: [
                Card_Home(image: 'assets/images/orders.png',name: 'الطلبات',ontap: (){
                  Navigator.push(
                      context,
                      CustomPageRoute(
                          child:Orders_page()));
                },),
                Card_Home(image: 'assets/images/categories.png',name: 'الاقسام',ontap: (){
                  Navigator.push(
                      context,
                      CustomPageRoute(
                          child:Categories_page()));
                },),
                Card_Home(image: 'assets/images/prodects.png',name: 'المنتجات',ontap: (){

                  Navigator.push(
                      context,
                      CustomPageRoute(
                          child:Prodect_Categories_page()));
                },),
                Card_Home(image: 'assets/images/admins.png',name: 'العروض',ontap: (){
                  Navigator.push(
                      context,
                      CustomPageRoute(
                          child:Admins_page()));
                },),
                Card_Home(image: 'assets/images/admins.png',name: 'المدراء',ontap: (){
                  Navigator.push(
                      context,
                      CustomPageRoute(
                          child:Admins_page()));
                },),




              ]),
            ),
          ],
        ),
      ),
    );
  }
}
