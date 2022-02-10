import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:jcoffee_app/controllers/coffee_controller.dart';
import 'package:jcoffee_app/screens/widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:jcoffee_app/screens/widgets/tp.dart';
import 'coffee_screen.dart';
class CoffeeListScreen extends StatelessWidget {
  const CoffeeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final SwiperController swiperController = SwiperController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: height,
        child: Stack(
          children: [
            GetBuilder<JCoffeeController>(
              init: JCoffeeController(),
              initState: (_) {},
              builder: (_) {
                if (_.list != null && _.list!.isNotEmpty) {
                  return Obx(() {
                    if (_.index.value != 0) {
                      swiperController.move(_.index.value, animation: true);
                    } else if (_.index.value == 0) {
                      _.hide.value = false;
                    }
                    return AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        decoration: buildBoxDecoration(_.index.value),
                        width: width,
                        height: height,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * .15),
                          child: Stack(
                            children: [
                              Swiper(
                                onIndexChanged: (value) {
                                  _.index.value = value!;
                                },
                                controller: SwiperController(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: height * .1),
                                    child: Container(
                                      width: width,
                                      height: height * 4,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(CoffeeScreen(
                                            controller: _,
                                            index: index,
                                          ));
                                        },
                                        child: Hero(
                                            tag: index,
                                            child:
                                                Image.asset(_.list![index]!.img!)),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: _.list!.length,
                                itemWidth: width * 0.9,
                                itemHeight: height * 0.6,
                                containerHeight: height * 0.6,
                                containerWidth: width * 0.9,
                                layout: SwiperLayout.STACK,
                                scrollDirection: Axis.vertical,
                              ),
                              AnimatedOpacity(
                                onEnd: () {
                                  _.hide.value = true;
                                },
                                duration: Duration(milliseconds: 400),
                                opacity: _.index.value == 0 ? 1.0 : 0.0,
                                child: !_.hide.value
                                    ? Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: height * .08),
                                          child: Text(
                                            "Coffee \n JFAQ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: height * .06,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ),
                              AnimatedPositioned(
                                top: _.index.value == 0 ? -height * .11 : 0,
                                duration: Duration(seconds: 1),
                                child: TPBar(
                                    controller: _,
                                    width: width,
                                    height: height,
                                    swiperController: swiperController),
                              ),
                            ],
                          ),
                        ));
                  });
                } else if (_.list != null && _.list!.isEmpty) {
                  return const Center(
                    child: Text("Veri Yok."),
                  );
                } else {
                  return Center(
                    child: SizedBox(
                      height: height * .2,
                      width: height * .2,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            AppBarWidget(width: width),
          ],
        ),
      ),
    );
  }
   BoxDecoration buildBoxDecoration(value) {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        value == 0 ? 0 : .7,
        value == 0 ? .7 : 1,
      ],
      colors: [
        value == 0 ? Colors.brown : Colors.white,
        value == 0 ? Colors.white : Colors.brown,
      ],
    ));
  }
}