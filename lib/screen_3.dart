import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_softbd/cards.dart';
import 'package:task_softbd/screen_2.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

 ///
  /// Controllers
  ///
  TextEditingController textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
     AppBar(
      backgroundColor: Colors.white,
      title: 
      Text('নতুন যোগ করুন',style: TextStyle(fontSize: 15),),
    ),
           floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: null,
        child: SvgPicture.asset('lib/assets/Home 6.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 60,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                },
                child: SvgPicture.asset('lib/assets/Home 2.svg')
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalenderScreen(),
                      ));
                  // setState(() {
                  //   index_color = 1;
                  // });
                },
                child: SvgPicture.asset('lib/assets/Home 3.svg')
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   index_color = 2;
                  // });
                },
                child: const Icon(
                  Icons.account_balance_wallet_outlined,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   index_color = 3;
                  // });
                },
                child: const Icon(
                  Icons.person_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
           
              child: Column( 
               mainAxisAlignment: MainAxisAlignment.center,
               children: 
                 [
                  InputText(
                    label: 'অনুচ্ছেদ লিখুন',
                    controller: textController,),
                    SizedBox(height: 10,),
                    InputText(label: 'অনুচ্ছেদের বিভাগ লিখুন', controller: textController , suffixIcon: 'arrow_drop_down',),
                    SizedBox(height: 10,),
                    InputText(
                    label: 'তারিখ ও সময়',
                    controller: textController,),
                 SizedBox(height: 10,),
                    InputText(label: 'স্থান', controller: textController ,),
                 SizedBox(height: 30,),


                  Container( height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.lightGreen],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    ),
          child:ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),),
            onPressed: () {
            showModalBottomSheet<void>(
           
            context: context,
            builder: (BuildContext context) {
             
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                      height: 50,
                      width: 50,
                      child: 
                      SvgPicture.asset('lib/assets/Frame.svg'),),
                      Text('নতুন অনুচ্ছেদ সংরক্ষন', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold ),),

                      SizedBox(height: 5,),

                      Text('আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে', style: TextStyle(fontSize: 10, ),),

                      SizedBox(height: 10,),

                       Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.green, Colors.lightGreen],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),),
                  onPressed:
                   (){},
                  child: Text('আরোও যোগ করুন',style: TextStyle(fontSize: 10, color: Colors.white),),
                ),
      )
       

                      
                    ],
                  ),
                ),
              );
            },
          );
                  },
                  child: Text('সংরক্ষণ করুন',style: TextStyle(fontSize: 10, color: Colors.white),),
                ),)
                 
                 
   
                ]
                )));
                

               
    
  }
}
