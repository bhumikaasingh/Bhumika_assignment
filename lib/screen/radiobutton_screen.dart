import 'package:bhumika/models/mathematics_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({super.key});

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  final myKey = GlobalKey<FormState>();
  int _value = 0;
  MathematicsModel? mathematicsModel;
  double? number1;
  double? number2;
  double? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bhumika Singh"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 255, 221, 118),
      body: Form(
        key: myKey,
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Number';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  number1 = double.tryParse(value);
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter  Number';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  number2 = double.tryParse(value);
                });
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
                const SizedBox(height: 8),
                const Text("Addition")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
                const SizedBox(height: 8),
                const Text("Subtraction")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
                const SizedBox(height: 8),
                const Text("Multiplication")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 4,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    }),
                const SizedBox(height: 8),
                const Text("Division")
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 88, 181, 253),
                  ),
                  onPressed: () {
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        if (_value == 1) {
                          mathematicsModel = MathematicsModel(
                              first: number1!, second: number2!);
                          result = mathematicsModel?.add();
                        } else if (_value == 2) {
                          MathematicsModel(first: number1!, second: number2!);
                          result = mathematicsModel?.subtraction();
                        } else if (_value == 3) {
                          MathematicsModel(first: number1!, second: number2!);
                          result = mathematicsModel?.multiplication();
                        } else {
                          MathematicsModel(first: number1!, second: number2!);
                          result = mathematicsModel?.division();
                        }
                      });
                    }
                  },
                  child: const Text("Calculate")),
            ),
            const SizedBox(
              height: 8,
            ),
            Text("Value is $result")
          ],
        ),
      ),
    );
  }
}
