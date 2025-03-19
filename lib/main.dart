import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Naman shivahre.com'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('your BMI'),
        backgroundColor: Colors.blue,


      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700
                ),),

                SizedBox(height: 21),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight in Kg'),
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter Your Height in fit'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter Your Height in inch'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //BMI calculation
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;
                    var bmi = iWt/(tM*tM);
                    var msg = "";
                    if(bmi>25){
                      msg = "You are OverWeight!!";
                      bgColor = Colors.orange.shade200;
                    }else if(bmi<18){
                      msg = "You are underWeight!!";
                      bgColor = Colors.red.shade200;
                    }else{
                      msg = "You are Healthy!!";
                      bgColor = Colors.green.shade200;
                    }
                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                    });

                  }
                  else{
                    setState(() {
                      result = "please fill all the requird blanks!!";
                    });
                  }
                },style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,), child: Text('Calculate')),

                SizedBox(height: 11,),
                Text(result, style: TextStyle(fontSize: 19),)

              ],
            ),
          ),
        ),
      )
    );
  }
}
