
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shelhop_flower_admin/core/app_theme.dart';
import 'package:shelhop_flower_admin/features/Prodects/presintation/Pages/Prodects_Page.dart';
import 'package:shelhop_flower_admin/features/Prodects/presintation/Widgets/Prodect_Categories_Card.dart';

class Prodect_Categories_page extends StatefulWidget {
  const Prodect_Categories_page({Key? key}) : super(key: key);

  @override
  State<Prodect_Categories_page> createState() => _Prodect_Categories_pageState();
}

class _Prodect_Categories_pageState extends State<Prodect_Categories_page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.primaryColor,title: Center(child: Text('الاقسام',style: AppTheme.textTheme.headline2,))),
      body: Column(
        children: [

          Expanded(
              flex: 1,
              child: Center(child: Text('اظغط على القسم للانتفال الى المنتجات',style: AppTheme.textTheme.bodyText1,))),
          Expanded(
            flex: 5,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('الاقسام').snapshots(),
              builder: (context, snapshot) {
                return  ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator .push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Prodects_Page(
                              name: snapshot.data!.docs[index]['name'],
                            )
                          )
                        );
                      },
                      child: Prodect_Categories_Card( name: snapshot.data!.docs[index]['name'],image: snapshot.data!.docs[index]['image'],id: snapshot.data!.docs[index].id,),
                    );
                  },


                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
