import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:task_softbd/cards.dart';
import 'package:task_softbd/helper.dart';
import 'package:task_softbd/model.dart';
import 'package:task_softbd/screen_1.dart';
import 'package:task_softbd/screen_3.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}


class _CalenderScreenState extends State<CalenderScreen> {
List<Schedule> schedule = <Schedule>[];


  @override
  void initState() {
    super.initState();
    Helper.fetch(
            context: context,
            uri:
                'https://api.npoint.io/bc69ae1f6991da81ab9a')
        .then((body) {
      setState(() {
        schedule.addAll(Helper.getItems(body));
      });
    });
  }


  @override
  Widget build(BuildContext context) {
  final currentDate = DateTime.now(); 
  

  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  String today = DateFormat('আজ, d MMMM', 'bn').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text('সময়রেখা',style: TextStyle(fontSize: 14,fontFamily: 'NotoSerifBengali'),textAlign: TextAlign.center,),
        Container(
        padding: EdgeInsets.all(5),
        width: 30,
        height: 30,
        decoration: const ShapeDecoration(
        color: Color(0xFFF4F5F6),
        shape: OvalBorder(),
        ),
        child: SvgPicture.asset('lib/assets/Bell.svg'),
        )
        ],
    ),
    ),
    drawer: const Drawer(),
    floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: null,
        child: SvgPicture.asset('lib/assets/Home 6.svg'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
       height: 60.0,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: SvgPicture.asset('lib/assets/Home 2.svg')
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => HomeScreen(),
                  //     ));
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
                  size: 30,
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
    body: 
     SafeArea(child: SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child:  Column(
          children:  [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text(today,style: TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 12,
                  fontFamily: 'NotoSerifBengali',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  ),),
               SizedBox(width: 5,),
              //  Spacer(),
      Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        ),
        child: 
         ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormPage(),
                      ));
                  },
                  child: Text('নতুন যোগ করুন',style: TextStyle(fontSize: 10, color: Colors.white),),
                ),
      )
             
              ],
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                  Card (
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
                  child: TableCalendar(
                  firstDay: _focusedDay.subtract(Duration(days: 7)),
                  lastDay: _focusedDay.add(Duration(days: 7)),
                  focusedDay: _focusedDay,
                          selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay; // update `_focusedDay` here as well
                      });
                    },
                          calendarStyle: CalendarStyle(),
                   headerVisible: false,
                   locale: 'bn_BN',
                   headerStyle: HeaderStyle(
                   formatButtonVisible : false,),
                   calendarFormat: CalendarFormat.week,
                  ) 
                  )
                  ),
                  SizedBox(height: 3,),
             Card(
              child: Container(
              width: width,
              height: height*0.5,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
              BoxShadow(
              color: Color(0x28000000),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
              )
              ],),
                child: ListView.builder(itemBuilder: (context, index){
                            return TimeCard(
                              name: schedule[index].attr['name'], 
                             category: schedule[index].attr['category'],
                             date: schedule[index].attr['date'], 
                             location: schedule[index].attr['location']);
                          },
                          itemCount: schedule.length ,
                          ), 
              ),
              ),

              ],
            )]))));
           
                 
                
  }}