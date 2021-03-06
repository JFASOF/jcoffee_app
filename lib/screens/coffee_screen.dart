import 'package:flutter/material.dart';
import 'package:jcoffee_app/controllers/coffee_controller.dart';
import 'package:jcoffee_app/screens/widgets/appbar.dart';
class CoffeeScreen extends StatelessWidget {
  final JCoffeeController controller;
  final int index;
  const CoffeeScreen({Key? key,required this.controller,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width,
                  padding: EdgeInsets.only(top: height * .09),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width * .27),
                      child: Center(
                        child: Text(
                          controller.list![index]!.title!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * .03),
                        ),
                      )),
                ),
                Container(
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * .06),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                              height: height * .5,
                              child: Hero(
                                  tag: index,
                                  child:
                                      Image.asset(controller.list![index]!.img!))),
                        ),
                        Positioned(
                            right: width * .05,
                            top: height * 0,
                            child: Icon(
                              Icons.add_circle_outline_rounded,
                              size: height * .07,
                            )),
                        Positioned(
                            left: width * .07,
                            bottom: 0,
                            child: Text(
                              "${controller.list![index]!.price!.toString()}???",
                              style: TextStyle(
                                  fontSize: height * .07,
                                  backgroundColor: Colors.black12,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: height * .03),
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.one_k,
                            size: height * .04,
                            color: Colors.grey,
                          ),
                          Text(
                            "S",
                            style: TextStyle(
                              fontSize: height * .04,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.one_k,
                            size: height * .05,
                            color: Colors.yellow[800],
                          ),
                          Text(
                            "M",
                            style: TextStyle(
                              fontSize: height * .04,
                              color: Colors.yellow[700],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.one_k,
                            size: height * .06,
                            color: Colors.grey,
                          ),
                          Text(
                            "L",
                            style: TextStyle(
                              fontSize: height * .04,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("S??cak",
                          style: TextStyle(fontSize: height * .03)),
                      Text("So??uk",
                          style: TextStyle(
                              fontSize: height * .03, color: Colors.grey)),
                    ],
                  ),
                )
              ],
            ),
            AppBarWidget(width: width),
          ],
        ),
      ),
    );
  }
}