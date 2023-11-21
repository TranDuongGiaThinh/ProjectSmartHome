


// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/views/scheduling/schedulingDetail_screen.dart';



class scheduling_screen extends StatefulWidget {
  const scheduling_screen({super.key});

  @override
  State<scheduling_screen> createState() => _scheduling_screenState();
}

// ignore: camel_case_types
class _scheduling_screenState extends State<scheduling_screen> {
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
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 237, 224, 224),),
          child: Padding(padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/2.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap:() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Scheduling_DetailScreen())),
            child:const Text('Sửa',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            const SizedBox(height: 15,),
            Row(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: const Text('20/11/23',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),
            const SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const Scheduling_DetailScreen();
            },
            child:const Text('4:00 AM',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            const SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/5.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const Scheduling_DetailScreen();
            },
            child:const Icon(Icons.timer_rounded,color: Colors.amber,) ,),),
            ],),
            const SizedBox(height: 20,),
            Container(height: 95,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width-20
            ,padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap:() => const Scheduling_DetailScreen(),
            child:Column(children: const [Text('Mô tả',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            TextField(decoration: InputDecoration(hintText: 'abcdefg'),)],),),),
          ],),),
        ),
        const SizedBox(height: 20,),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 237, 224, 224),),
          child: Padding(padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/2.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap:() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Scheduling_DetailScreen())),
            child:const Text('Sửa',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            const SizedBox(height: 15,),
            Row(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: const Text('20/11/23',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),
            const SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const Scheduling_DetailScreen();
            },
            child:const Text('4:00 AM',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            const SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/5.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const Scheduling_DetailScreen();
            },
            child:const Icon(Icons.timer_rounded,color: Colors.amber,) ,),),
            ],),
            const SizedBox(height: 20,),
            Container(height: 95,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width-20
            ,padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap:() => const Scheduling_DetailScreen(),
            child:Column(children: const [Text('Mô tả',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            TextField(decoration: InputDecoration(hintText: 'abcdefg'),)],),),),
          ],),),
        ),
        const SizedBox(height: 20,),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 237, 224, 224),),
          child: Padding(padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/2.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap:() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Scheduling_DetailScreen())),
            child:const Text('Sửa',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            const SizedBox(height: 15,),
            Row(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: const Text('20/11/23',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),
            const SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const Scheduling_DetailScreen();
            },
            child:const Text('4:00 AM',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            const SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/5.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const Scheduling_DetailScreen();
            },
            child:const Icon(Icons.timer_rounded,color: Colors.amber,) ,),),
            ],),
            const SizedBox(height: 20,),
            Container(height: 95,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width-20
            ,padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap:() => const Scheduling_DetailScreen(),
            child:Column(children: const [Text('Mô tả',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            TextField(decoration: InputDecoration(hintText: 'abcdefg'),)],),),),
          ],),),
        ),
        const SizedBox(height: 20,),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color.fromARGB(255, 237, 224, 224),),
          child: Padding(padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/2.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap:() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Scheduling_DetailScreen())),
            child:const Text('Sửa',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            const SizedBox(height: 15,),
            Row(children: [
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: const Text('20/11/23',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),
            const SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/3.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const Scheduling_DetailScreen();
            },
            child:const Text('4:00 AM',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,),),
            const SizedBox(width: 10,),
            Container(height: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width/5.5,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap: (){const Scheduling_DetailScreen();
            },
            child:const Icon(Icons.timer_rounded,color: Colors.amber,) ,),),
            ],),
            const SizedBox(height: 20,),
            Container(height: 95,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: Colors.black54),
            width:MediaQuery.of(context).size.width-20
            ,padding: const EdgeInsets.fromLTRB(5, 10, 5, 10)
            ,child: GestureDetector(onTap:() => const Scheduling_DetailScreen(),
            child:Column(children: const [Text('Mô tả',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            TextField(decoration: InputDecoration(hintText: 'abcdefg'),)],),),),
          ],),),
        ),
        const SizedBox(height: 20,),
      ],
      ),),
      ),
    );
  }
}

void schedulingDetaiScreen(BuildContext context) {
    Navigator.push(
        context ,
        MaterialPageRoute(
          builder: (context) =>  const Scheduling_DetailScreen(),
        ));
  }