import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_practice/animated_menu_icon_animation_controller.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    AnimatedMenuIconAnimationController animatedMenuIconAnimationController =
    Get.put(AnimatedMenuIconAnimationController());
    RxBool menuClicked = animatedMenuIconAnimationController.isPlaying;
    RxBool diceClicked = false.obs;
    RxBool initAnim = false.obs;

    Future.delayed(const Duration(milliseconds: 1000), () {
      initAnim.value = true;
    });

    return Obx(() => Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Using AnimatedSlide for "Ripples" Text Animation
                  AnimatedSlide(
                    offset: diceClicked.value ? Offset(1.1, 0) : Offset(0, 0),
                    duration: const Duration(milliseconds: 555),
                    curve: Curves.linearToEaseOut,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 555),
                      curve: Curves.linearToEaseOut,
                      opacity: diceClicked.value ? 1 : 0,
                      child: GestureDetector(
                        onTap: () {
                          initAnim.value = false;
                          diceClicked.value = false;
                          menuClicked.value = false;
                          Future.delayed(const Duration(milliseconds: 1500), () {
                          initAnim.value = true;
                        });
                        },
                        child: Text(
                          "Ripples",
                          style: TextStyle(
                            fontSize: size.width * .081,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    // onTap: () => menuClicked.value = !menuClicked.value,
                    onTap: () => animatedMenuIconAnimationController.triggerMenuClick(),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 555),
                      curve: Curves.linearToEaseOut,
                      opacity: diceClicked.value ? 1 : 0,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        size: size.width * .075,
                        color: Colors.black,
                        progress:
                        animatedMenuIconAnimationController
                            .controller.value),
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.width * .1,),
              SizedBox(
                width: size.width,
                height: size.width * 1.1,
                child: Stack(
                  children: [
                    
                    //3rd Dice
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 555),
                      curve: Curves.linearToEaseOut,
                      bottom: initAnim.value ? diceClicked.value ? 0 : size.width * 1.1 * .5 - size.width * .55 * .5 : size.width * 1.1 * .5,
                      right: initAnim.value ? diceClicked.value ? 0 : (size.width - 42) * .5 - size.width * .55 * .5 : (size.width - 42) * .5,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 555),
                        curve: Curves.linearToEaseOut,
                        width: initAnim.value ? diceClicked.value ? menuClicked.value ? size.width - 42 : size.width * .43 : size.width * .55 : 0,
                        height: initAnim.value ? diceClicked.value ? menuClicked.value ? size.width * 1.1 : size.width * .43 : size.width * .55 : 0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(menuClicked.value ? 50 : 150),
                        ), 
                      ),
                    ),
                  
                    //2nd Dice
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 555),
                      curve: Curves.linearToEaseOut,
                      top: initAnim.value ? diceClicked.value ? menuClicked.value ? size.width * .081 + 42 : 0 : size.width * 1.1 * .5 - size.width * .47 * .5 : size.width * 1.1 * .5,
                      right: initAnim.value ? diceClicked.value ? menuClicked.value ? 21 : 0 : (size.width - 42)* .5 - size.width * .47 * .5 : (size.width - 42)* .5,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 555),
                        curve: Curves.linearToEaseOut,
                        width: initAnim.value ? diceClicked.value ? menuClicked.value ? size.width - 42 - 42 : size.width * .43 : size.width * .47 : 0.0,
                        height: initAnim.value ? diceClicked.value ? menuClicked.value ? size.width * 1.1 - size.width * .081 - 42 - 21 : size.width * .63 : size.width * .47 : 0.0,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(menuClicked.value ? 50 : 150),
                        ),
                      ),
                    ),
          
                    //1st Dice
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 555),
                      curve: Curves.linearToEaseOut,
                      top: diceClicked.value ? menuClicked.value ? 21 : 0 : size.width * 1.1 * .5 - size.width * .38 * .5,
                      left: diceClicked.value ? menuClicked.value ? size.width - size.width * .081 - 21 - 42 : 0 : (size.width - 42)* .5 - size.width * .38 * .5,
                      child: GestureDetector(
                        onTap: () => diceClicked.value = true,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 555),
                          curve: Curves.linearToEaseOut,
                          width: diceClicked.value ? menuClicked.value ? size.width * .081 : size.width * .43 : size.width * .38,
                          height: diceClicked.value ? menuClicked.value ? size.width * .081 : size.width * 1.1 : size.width * .38,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(150),
                          ),
                          child: Center(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 333),
                              curve: Curves.linearToEaseOut,
                              opacity: initAnim.value ? diceClicked.value ? 0 : 1 : 0,
                              child: Text("Go",
                                style: TextStyle(
                                  fontSize: size.width * .071,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white
                                ),
                              ), 
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    )
    );  
  }
}
