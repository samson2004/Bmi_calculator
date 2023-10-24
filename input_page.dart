import 'package:calculatorbmi/screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reuseablecard.dart';
import 'iconcontent.dart';
import 'constants.dart';
import 'calcbrain.dart';



enum Gender{male,female,shemale}

class inputpage extends StatefulWidget {
  const inputpage({super.key});
  final int weight=60;
  final int height=180;


  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {

  Gender selectedgender=Gender.shemale;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(child: reusablecard(
                    onpress: (){
                      setState(() {
                        selectedgender=Gender.male;
                      });
                    },
                      activecolor: selectedgender==Gender.male?kactivecardcolor:kinactivecardcolor,
                    cardChild:Iconcontent(icon: Icons.male,text: "MALE",)
                  )),
                  Expanded(child:reusablecard(
                      onpress: (){
                        setState(() {
                          selectedgender=Gender.female;
                        });
                      },
                    activecolor: selectedgender==Gender.female?kactivecardcolor:kinactivecardcolor,
                      cardChild:Iconcontent(icon: Icons.female,text: "FEMALE" )

                  )),
                ],
              ),
            ),
            Expanded(child: reusablecard(
              activecolor: kinactivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',style: klabeltextstyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline ,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style: klabelnumberstyle,),
                      Text('cm',style:klabeltextstyle ,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTickMarkColor: Color(0xFFa6a6a6),
                      thumbColor: Colors.pink,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                      overlayColor: Color(0x29e91e63),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 220.0,
                      onChanged: (double newvalue){
                        setState(() {
                          height=newvalue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),

            )),
            Container(
              child: Row(
                children: [
                  Expanded(child: reusablecard(
                    activecolor: kinactivecardcolor,
                    cardChild: Column(
                      children: [
                        Text('WEIGHT',style: klabeltextstyle,),
                        Text(weight.toString(),style: klabelnumberstyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbuttton(icon: Icons.remove,
                            onpressed: (){
                              setState(() {
                                weight--;
                              });
                            },),
                            SizedBox(
                              width: 20,
                            ),
                            Roundiconbuttton(icon: Icons.add,
                            onpressed: (){
                              setState(() {
                                weight++;
                              });
                            },)
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(child:reusablecard(
                    activecolor: kinactivecardcolor,
                    cardChild: Column(
                      children: [
                        Text('AGE',style: klabeltextstyle,),
                        Text(age.toString(),style: klabelnumberstyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbuttton(icon: Icons.remove,
                                onpressed:(){
                              setState(() {
                                age--;
                              });
                                }),
                            SizedBox(
                              width: 20,
                            ),
                            Roundiconbuttton(icon: Icons.add,
                                onpressed:(){
                              setState(() {
                                age++;
                              });
                                })
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Card(
                child: GestureDetector(
                  onTap: (){
                    calculator(kheight: height,kweight: weight);
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=> screen2()));
                  },
                  child: Container(
              height: kbottombuttonheight,
              width: double.infinity,
              color: kbottombuttoncolor,
              padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
              child: GestureDetector(
                  child: Text(
                    "Caluclate your BMI",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
              ),
            ),
                )) //Button
          ],
        ));
  }
}


class Roundiconbuttton extends StatelessWidget {
  const Roundiconbuttton({required this.icon,required this.onpressed});
  final IconData icon;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,size: 35,),
    onPressed: onpressed,
    elevation:6.0,
    disabledElevation: 6.0,
    shape: CircleBorder(),
    fillColor: Color(0xFF676a82),
    constraints: BoxConstraints.tightFor(
      width: 60,
      height: 60
    ),);
  }
}
