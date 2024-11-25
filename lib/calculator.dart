

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class TipCalculatorPage extends StatefulWidget {
  @override
  _TipCalculatorPageState createState() => _TipCalculatorPageState();
}

class _TipCalculatorPageState extends State<TipCalculatorPage> {
  double billAmount = 0.0;
  double totalAmount = 0.0;
  int selectedTipPercentage = 15;

  final List<int> tipPercentages = [15, 20, 25];
  TextEditingController billAmountController = TextEditingController();

  void calculateTotal() {
    setState(() {
      billAmount = double.tryParse(billAmountController.text) ?? 0.0;
      totalAmount = billAmount + (billAmount * selectedTipPercentage / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300], // Background color for the app bar
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //profile
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/img.jpg"), // Replace with your profile image path
                ),
                SizedBox(width: 10),
                Text(
                  "Welcome back!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          
         
      
          // Input for bill amt
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(40)),color: Colors.white),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90,vertical: 30),
              child: TextField(
                controller: billAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Bill Amount", // This is the hint text
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          // SizedBox(height: 20),
      
          // Tip percentage
          Container(
            height: 200,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: DropdownButton<int>(
                value: selectedTipPercentage,
                onChanged: (newValue) {
                  setState(() {
                    selectedTipPercentage = newValue!;
                  });
                },
                items: tipPercentages.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text('$value%'),
                  );
                }).toList(),
              ),
            ),
          ),
          
      
          // Calculate
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.yellow[200]),
            height: 150,
            child: Center(
              child: ElevatedButton(
                onPressed: calculateTotal, 
                child: Text("Calculate"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
      
          // Total Amt
          SizedBox(height:20,),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.red[400]),
            height: 90,
            
            child: Center(
              child: Text(
                "Total Amount: ${totalAmount.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
