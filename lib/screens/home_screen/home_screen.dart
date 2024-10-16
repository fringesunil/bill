import 'package:billapp/screens/home_screen/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0XFFE4E2D4),
          body: SingleChildScrollView(
            child: Consumer<HomeProvider>(
                builder: (context, home, child) => Form(
                      key: home.calculateKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.06,
                                    vertical: size.height * 0.02),
                                child: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: size.height * 0.04,
                                  backgroundImage:
                                      const AssetImage('assets/prof.jpeg'),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Welcome Back,"),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  const Text(
                                    "Fringe Sunil",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                height: size.height * 0.68,
                                width: size.width,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.06),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text("Total Bill Amount"),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Container(
                                        height: size.height * 0.06,
                                        width: size.width * 0.90,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.02),
                                          child: TextFormField(
                                            controller: home.billController,
                                            validator:
                                                home.validator.billAmount,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Bill Amount"),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      const Text("Tip Percentage"),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Container(
                                        height: size.height * 0.06,
                                        width: size.width * 0.90,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: DropdownButton(
                                            underline: const SizedBox.shrink(),
                                            value: home.dropdownvalue,
                                            icon: Row(
                                              children: [
                                                SizedBox(
                                                  width: size.width * 0.75,
                                                ),
                                                const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.black,
                                                ),
                                              ],
                                            ),
                                            items: <String>[
                                              '5',
                                              '10',
                                              '15',
                                              '20'
                                            ].map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: size.width * 0.02),
                                                  child: Text(value),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: ((value) {
                                              setState(() {
                                                home.dropdownvalue = value!;
                                              });
                                            })),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: size.height * 0.32,
                                  child: Container(
                                    width: size.width,
                                    height: size.height * 0.36,
                                    decoration: BoxDecoration(
                                        color: const Color(0XFFF8D082),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Grand Total",
                                          style: TextStyle(fontSize: 28),
                                        ),
                                        Text(
                                            (home.grandTotal)
                                                .toStringAsFixed(2),
                                            style:
                                                const TextStyle(fontSize: 30))
                                      ],
                                    )),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              if (home.calculateKey.currentState!.validate()) {
                                home.calculateAmt();
                              }
                            },
                            child: Container(
                              width: size.width,
                              height: size.height * 0.10,
                              decoration: BoxDecoration(
                                color: const Color(0XFFF77564),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      "Calculate",
                                      style: TextStyle(fontSize: 28),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
          )),
    );
  }
}
