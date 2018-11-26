import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class CalendarPage extends StatelessWidget{

  Color checkDate(DateTime date){
    return date.day == 14 ? Colors.green:Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10.0,
        ),
        child: ListView(
//          shrinkWrap: true,
          children: <Widget>[
            //Its the Headline with padding widget
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Calender Example',textAlign: TextAlign.center,style: Theme.of(context).textTheme.display1,),
            ),
            Calendar(
              showCalendarPickerIcon: true,
              showTodayAction: false,
              //Onclick method for dates
              onDateSelected:(date){
                // When you click on any date it will print the DateTime value
                print(date);
              },
              //It is the part where we edit the date display part
              dayBuilder: (BuildContext context, DateTime day){
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //here i am printing the date
                      Text('${day.day.toString()}',textAlign: TextAlign.center,),
                      //its the box which only green color when the date is 14..
                      // If you wanna change the date where its green change the checkDate() value
                      Container(
                        width: 10.0,
                        height: 10.0,
                        //here i am calling checkDate(date) function with date object
                        // function will return color for the container
                        color: checkDate(day),
                      )
                    ],
                  ),
                );
              },
              onSelectedRangeChange: (range) =>
                  print("Range is ${range.item1}, ${range.item2}"),
//              isExpandable: true,
            ),
          ],
        ),
      ),
    );
  }

}