
import 'package:flutter/material.dart';
import 'package:shelhop_flower_admin/core/app_theme.dart';
import 'package:shelhop_flower_admin/core/util/ScreenUtil.dart';

class Card_Home extends StatefulWidget {
  String name;
  String image;
  final ontap;
   Card_Home({Key? key,required this.ontap,required this.name,required this.image}) : super(key: key);

  @override
  State<Card_Home> createState() => _Card_HomeState();
}

class _Card_HomeState extends State<Card_Home> {
 ScreenUtil screenUtil =ScreenUtil();
  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return InkWell(
      onTap: (){
        widget.ontap();
      },
      child: Container(
          height: screenUtil.screenHeight *.2,
          width: screenUtil.screenWidth *.2,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
            child: Column(
                children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                    child: Image.asset(widget.image,fit: BoxFit.cover,)),
              ),
              SizedBox(height: 10,),
                  Expanded(
                    flex: 1,
                    child: Center(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(border: Border.all(color: AppTheme.primaryColor,width: 2,),
                      borderRadius: BorderRadius.all(Radius.circular(20))


                    ),
                    child: Center(child: Text(widget.name,style: AppTheme.textTheme.headline6,)),
                ),
              ),
                  )
            ]),


          )

      ),
    );
  }
}
