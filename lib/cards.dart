import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';




class ProfileCard extends StatelessWidget {
  final String? name;
  final String? location;
  final String? companyName;

  const ProfileCard(
      {Key? key,
      this.name,
      this.location,
      this.companyName,
      }
      ):super(key: key);

  
  @override
  
  Widget build(BuildContext context) {
    
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

    return Card(
            child: Container(
              width: width,
              height: height*0.16,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
              BoxShadow(
              color: Color(0x28000000),
              blurRadius: 6,
              offset: Offset(0, 0),
              spreadRadius: 0,
              )
              ],),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
            color: Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),),),
            child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                      image: AssetImage('lib/assets/image 2.jpg'),
                      fit: BoxFit.fill,), ),), ],),),
                  const SizedBox(width: 16),
                        Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        SizedBox( child:  Text(
                        name.toString(),
                        style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 20,
                        fontFamily: 'NotoSerifBengali',
                        fontWeight: FontWeight.w700,
                        height: 0.07,
                        ),
                        ),),
                  const SizedBox(height: 30),
                           SizedBox( child: 
                            Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                            companyName.toString(),
                            style: TextStyle(
                            color: Color(0xFF6A6A6A),
                            fontSize: 14,
                            fontFamily: 'NotoSerifBengali',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            ),
                            ),
                      SizedBox(height: 10),
                    
                        SizedBox(
                              child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              SvgPicture.asset('lib/assets/Map Point.svg'),
                              const SizedBox(width: 4),
                              Text(
                              location.toString(),
                              style: TextStyle(
                              color: Color(0xFF6A6A6A),
                              fontSize: 14,
                              fontFamily: 'NotoSerifBengali',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              ),)])
                             )])), 
                        ]))]))); 
  }}
  
 class TimeBox extends StatelessWidget {
  final String label;
  final int value;

  TimeBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            '$value',
            style: TextStyle(fontSize: 9, color: Colors.black),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 9, color: Colors.black),
        ),
      ],
    );
  }
}

class TimeCard extends StatelessWidget {
  final String date;
  final String name;
  final String location;
  final String category; 
 

   const TimeCard({super.key,
   required this.name,
   required this.category,required this.date,required this.location 
   });

  @override
  
  Widget build(BuildContext context) {
  
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
    return   
      Row(
                  children: 
                  [
                    SizedBox(
                      height: 60,
                      width: 70,
                      child: Column(
                        
                        //  padding: EdgeInsets.all(3),
                        children: [Text('সকাল',textAlign: TextAlign.center, style: TextStyle(fontSize: 10) ,),
                        SizedBox(height: 3,),
                        Text('2.30',textAlign: TextAlign.center, style: TextStyle(fontSize: 10)),
                  ]),
                    ),
                    Spacer(),
                    Card(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                      height: height*0.25,
                      width: width*0.52,
                      decoration: ShapeDecoration(
                          gradient: LinearGradient(
                          begin: Alignment(0.85, -0.53),
                          end: Alignment(-0.85, 0.53),
                          colors: [Color(0xFF86B560), Color(0xFF336F4A)],
                          ),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.72),
                          ),),
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('lib/assets/Clock Circle.svg'),
                                  SizedBox(width: 3,),
                                  Text(date,style: TextStyle(fontSize: 10, color: Colors.white))
                                ],
                              ),
                              SizedBox(height: 5,),
                              SizedBox(
                              height: height*0.1,
                              width: width*0.45,
                              child: 
                              Container(
                                padding: EdgeInsets.all(3),
                                child: Text(name,style: TextStyle(fontSize: 10, color: Colors.white)),
                               )
                                ),
                               SizedBox(height: 5,),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    
                                    child: Text(category,style: TextStyle(fontSize: 10, color: Colors.white)),),
                                
                               SizedBox(height: 5,),
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset('lib/assets/Map Point_w.svg',),
                                  SizedBox(width: 3,),
                                  Text(location,style: TextStyle(fontSize: 10, color: Colors.white),)
                                ],
                               )
                            ],
                          ),
                  ]),
                    )
                )],
                );       
  }
}
class InputText extends StatelessWidget {
  final String label;
  final String? suffixIcon;
  final Function(String)? onChanged;

  final Function()? onTap;
  final TextEditingController? controller;

  const InputText(
      {Key? key,
      required this.label,
      this.suffixIcon = "",
      this.onChanged,
      this.controller,
      this.onTap,
      }
      )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        // maxLength: 11,
        // maxLines: 1,

        decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 8),
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.grey[700], fontSize: 10
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0),
                borderRadius: BorderRadius.circular(10),
               ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                ),
            ),
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}



