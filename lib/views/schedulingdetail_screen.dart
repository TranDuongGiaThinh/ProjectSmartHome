import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smart_home/views/scheduling_screen.dart';

class schedulingDetail_screen extends StatefulWidget {
  const schedulingDetail_screen({super.key});

  @override
  State<schedulingDetail_screen> createState() => _schedulingDetail_screenState();
}

class _schedulingDetail_screenState extends State<schedulingDetail_screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(padding:const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 237, 224, 224),),
          child: Padding(padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/2.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('Sửa',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(height: 15,),
            Row(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('20/11/23',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('4:00 AM',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/5.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Icon(Icons.timer_rounded,color: Colors.amber,) ,),),
            ],),
            SizedBox(height: 20,),
            Container(height: 95,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width-20
            ,padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Column(children: [const Text('Mô tả',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            TextField(decoration: InputDecoration(hintText: 'abcdefg'),)],),),),
          ],),),
        ),
        SizedBox(height: 20,),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 237, 224, 224),),
          child: Padding(padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/2.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('Sửa',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(height: 15,),
            Row(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('20/11/23',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('4:00 AM',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/5.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Icon(Icons.timer_rounded,color: Colors.amber,) ,),),
            ],),
            SizedBox(height: 20,),
            Container(height: 95,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width-20
            ,padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Column(children: [const Text('Mô tả',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            TextField(decoration: InputDecoration(hintText: 'abcdefg'),)],),),),
          ],),),
        ),
        SizedBox(height: 20,),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 237, 224, 224),),
          child: Padding(padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/2.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('Sửa',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(height: 15,),
            Row(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('20/11/23',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('4:00 AM',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/5.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Icon(Icons.timer_rounded,color: Colors.amber,) ,),),
            ],),
            SizedBox(height: 20,),
            Container(height: 95,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width-20
            ,padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Column(children: [const Text('Mô tả',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            TextField(decoration: InputDecoration(hintText: 'abcdefg'),)],),),),
          ],),),
        ),
        SizedBox(height: 20,),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 237, 224, 224),),
          child: Padding(padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/2.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('Sửa',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(height: 15,),
            Row(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('20/11/23',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Text('4:00 AM',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/5.5,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Icon(Icons.timer_rounded,color: Colors.amber,) ,),),
            ],),
            SizedBox(height: 20,),
            Container(height: 95,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width-20
            ,padding: EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const SchedulingScreen();
            },
            child:Column(children: [const Text('Mô tả',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            TextField(decoration: InputDecoration(hintText: 'abcdefg'),)],),),),
          ],),),
        )
      ],
      ),),
      ),
    );
  }
}