import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    RxBool menuClicked = false.obs;
    RxBool diceClicked = false.obs;
    RxBool initAnim = false.obs;

    Future.delayed(const Duration(milliseconds: 1500), () {
      initAnim.value = true;
    });

    return Obx(() => Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => menuClicked.value = !menuClicked.value,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 555),
                  curve: Curves.linearToEaseOut,
                  opacity: diceClicked.value ? 1 : 0,
                  child: const Icon(Icons.menu)
                )
              ), 
              SizedBox(height: size.width * .075,),
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
                        width: initAnim.value ? diceClicked.value ? menuClicked.value ? size.width - 42 : size.width * .44 : size.width * .55 : 0,
                        height: initAnim.value ? diceClicked.value ? menuClicked.value ? size.width * 1.1 : size.width * .44 : size.width * .55 : 0,
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
                        width: initAnim.value ? diceClicked.value ? menuClicked.value ? size.width - 42 - 42 : size.width * .44 : size.width * .47 : 0.0,
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
                          width: diceClicked.value ? menuClicked.value ? size.width * .081 : size.width * .44 : size.width * .38,
                          height: diceClicked.value ? menuClicked.value ? size.width * .081 : size.width * 1.1 : size.width * .38,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(150),
                          ),
                          child: Center(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 333),
                              curve: Curves.linearToEaseOut,
                              opacity: diceClicked.value ? 0 : 1,
                              child: Text("Go",
                                style: TextStyle(
                                  fontSize: size.width * .047,
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
