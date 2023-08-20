import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shelhop_flower_admin/core/app_theme.dart';
import 'package:shelhop_flower_admin/core/util/ScreenUtil.dart';

class Orders_page extends StatefulWidget {
  const Orders_page({Key? key}) : super(key: key);

  @override
  State<Orders_page> createState() => _Orders_pageState();
}

class _Orders_pageState extends State<Orders_page> {
  @override
  ScreenUtil screenUtil = ScreenUtil();
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: Center(
              child: Text(
            'قائمة الطلبات',
            style: AppTheme.textTheme.headline2,
          ))),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('قائمه الطلبات')
              .snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child:snapshot.data!.docs[index]['OrderN'].toString()=='3879000'?


                  Opacity(
                    opacity: .3,
                    child: Card(
                      elevation: 10,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            height: screenUtil.screenHeight * .1,
                            width: double.infinity,
                            child: ListTile(
                              trailing: Column(
                                children: [
                                  Text( snapshot.data!.docs[index]['OrderN'].toString(),style:  TextStyle( color: AppTheme.secondaryColor,fontFamily: AppTheme.fontFamily)),
                                 // Text( snapshot.data!.docs[index]['count'].toString()),


                                ],
                              ),
                              title: Center(
                                  child: Text(snapshot.data!.docs[index]['name'],style:TextStyle( color: AppTheme.secondaryColor,fontFamily: AppTheme.fontFamily)       ,),),
                              leading: CircleAvatar(
                                radius: 40,

                                backgroundImage: NetworkImage(snapshot.data!.docs[index]['imgurl'],),

                              ),
                            ))),
                  ):Card(
                      elevation: 10,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          height: screenUtil.screenHeight * .1,
                          width: double.infinity,
                          child: ListTile(
                            trailing: Column(
                              children: [
                                Text( snapshot.data!.docs[index]['OrderN'].toString(),style:  TextStyle( color: AppTheme.secondaryColor,fontFamily: AppTheme.fontFamily)),
                                // Text( snapshot.data!.docs[index]['count'].toString()),


                              ],
                            ),
                            title: Center(
                              child: Text(snapshot.data!.docs[index]['name'],style:TextStyle( color: AppTheme.secondaryColor,fontFamily: AppTheme.fontFamily)       ,),),
                            leading: CircleAvatar(
                              radius: 40,

                              backgroundImage: NetworkImage(snapshot.data!.docs[index]['imgurl'],),

                            ),
                          ))),
                );
              },
            );
          }),
    );
  }
}
