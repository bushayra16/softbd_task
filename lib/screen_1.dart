import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:table_calendar/table_calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_softbd/cards.dart';
import 'package:task_softbd/screen_2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
double progress = 0.0;
Timer? timer;

  // Total duration in days 
  final int totalDurationInDays = 365;
  final DateTime startDate = DateTime.now();

  String formatDateRange(DateTime startDate, DateTime endDate) {
    final DateFormat dateFormat = DateFormat('y/MM/dd', 'bn');
    String joiningDate = dateFormat.format(startDate);
    String exitDate = dateFormat.format(endDate);
    return '$joiningDate - $exitDate';
  }

  // void startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
  //     setState(() {
  //       final currentDate = DateTime.now();
  //       final elapsedDays = currentDate.difference(startDate).inDays;
  //       progress = elapsedDays / totalDurationInDays;

  //       if (progress >= 1.0) {
  //         timer?.cancel();
  //         progress = 1.0;
  //       }
  //     });
  //   });
  // }

    String daysElapsedInYear() {
    final currentDate = DateTime.now();
    final startOfYear = DateTime(2024, 1, 1);
    final elapsedDays = currentDate.difference(startOfYear).inDays + 1;
    final months = elapsedDays ~/ 30; // Approximate number of months
    final days = elapsedDays % 30; // Remaining days
    progress = elapsedDays /totalDurationInDays;
    // Format the result in Bangla
    final banglaNumberFormat = NumberFormat.compact(locale: "bn");
    final formattedMonths = banglaNumberFormat.format(months);
    final formattedDays = banglaNumberFormat.format(days);

    

    return '$formattedMonths মাস $formattedDays দিন';
    
  }

   @override
  void initState() {
    super.initState();
    daysElapsedInYear();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  Map<String, int> remainingTime = calculateRemainingTime(DateTime(2030, 12, 31));
  DateTime startDate = DateTime(2024, 1, 1);
  DateTime endDate = DateTime(2030, 1, 1);

    String formattedDateRange = formatDateRange(startDate, endDate);
  
    return Scaffold(
    appBar:
     AppBar(
      backgroundColor: Colors.white,
      title: const Row(
        children: [
          Image(image: AssetImage('lib/assets/demo 1.jpg') ),
          SizedBox(width: 10,),
          Text('Flutter Task',style: TextStyle(fontSize: 16))
        ],
      ),
      actions: [
        Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        width: 35,
        height: 35,
        decoration: const ShapeDecoration(
        color: Color(0xFFF4F5F6),
        shape: OvalBorder(),
        ),
        child: SvgPicture.asset('lib/assets/Bell.svg'),
        )
        ]
    ),
          drawer:  Drawer( child: ListView(
          padding: EdgeInsets.zero,
          children:const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            )]),
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
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const ProfileCard(
                    name: 'মোঃ মোহাইমেনুল রেজা',
                    companyName: 'সফটবিডি লিমিটেড',
                    location: 'ঢাকা',
                  ),
                  const SizedBox(height: 20,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                          CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 8.0,
                          percent: progress,  
                          animation: true,
                          backgroundColor: Colors.black12,
                          progressColor: Colors.green,
                          center: Text(
                            daysElapsedInYear(),
                            style: TextStyle(fontSize: 10, fontFamily: 'NotoSerifBengali'),
                          ),),
                         SizedBox(height: 5),
                    const Text(
                    'অতিবাহিত সময়',
                      style: TextStyle(fontSize: 10,fontFamily: 'NotoSerifBengali',fontWeight: FontWeight.bold),
                              ),
                ]),
                SizedBox(width: 30,),
                      
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text('মেয়াদকাল', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'NotoSerifBenglai'),),
                     SizedBox(height: 3,),
                     Row(
                      children: [
                        SvgPicture.asset('lib/assets/Calendar.svg'),
                        SizedBox(width: 3,),
                        Text(formattedDateRange, style: TextStyle(color: Colors.black, fontSize: 10,))
                      ],
                     ),
                     SizedBox(height: 5,),
                     Text(
                       'আরও বাকি',
                        style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
                         ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimeBox(label: 'বছর', value: remainingTime['years'] ?? 0),
                  SizedBox(width: 10),
                  TimeBox(label: 'মাস', value: remainingTime['months'] ?? 0),
                  SizedBox(width: 10),
                  TimeBox(label: 'দিন', value: remainingTime['days'] ?? 0),
                 ],
                ),
                ],
              )
                    ],),
                // IconFrame(label: 'ক্রমিক নং ০০০১', child: SvgPicture.asset('lib/assets/Group.svg')),
                // IconFrame(label: 'ক্রমিক নং ০০০১', child: SvgPicture.asset('lib/assets/Group.svg')),
                // IconFrame(label: 'ক্রমিক নং ০০০১', child: SvgPicture.asset('lib/assets/Group.svg')),
                // IconFrame(label: 'ক্রমিক নং ০০০১', child: SvgPicture.asset('lib/assets/Group.svg')),
                // IconFrame(label: 'ক্রমিক নং ০০০১', child: SvgPicture.asset('lib/assets/Group.svg')),
                // IconFrame(label: 'ক্রমিক নং ০০০১', child: SvgPicture.asset('lib/assets/Group.svg')),

            
            
          ],
        )));
         
              
  }
   Map<String, int> calculateRemainingTime(DateTime endDate ) {
    
    DateTime now = DateTime.now();
    int years = endDate.year - now.year;
    int months = endDate.month - now.month;
    int days = endDate.day - now.day;

    // if (days < 0) {
    //   months -= 1;
    //   days += DateTime(now.year, now.month + 1, 0).day;
    // }
    // if (months < 0) {
    //   years -= 1;
    //   months += 12;
    // }

    return {
      'years': years,
      'months': months,
      'days': days,
    };
  }
  
}
  


