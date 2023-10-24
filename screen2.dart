import 'package:calculatorbmi/calcbrain.dart';
import 'package:calculatorbmi/screen1.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reuseablecard.dart';
import 'package:restart_app/restart_app.dart';
import 'screen1.dart';
import 'calcbrain.dart';

calculator calc=calculator(kweight: null,kheight: null);

class screen2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Text('Your Result',style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600
          ),),
          reusablecard(
              activecolor: kinactivecardcolor,
            kheight: 660,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(calc.result(),style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.green,
                    fontWeight: FontWeight.w500
                ),),
                Text(calc.calculatebmi(),style: klabellargenumberstyle,),
                Text('18.5<=BMI<=25.5 is Normal ',style:klabeltextstyle,),
                Text(calc.getinterpertation(),style: klabeltextstyle,),
              ],
            ),
          ),
          Card(
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  // Restart.restartApp();
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>const bmi()));
                },
                child: Container(
                  height: kbottombuttonheight,
                  width: 500,
                  color: kbottombuttoncolor,
                  padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                  child: GestureDetector(
                    child: Text(
                      "ReCaluclate  BMI",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ))

        ],
      )
    );
  }
}
