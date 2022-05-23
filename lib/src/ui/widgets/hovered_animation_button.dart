import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme/theme.dart';
import 'widgets.dart';

// ignore: must_be_immutable
class HoveredAnimatedButton extends HookWidget {
  bool mouseOn = false;

  HoveredAnimatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationController animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    Animation animation = Tween<double>(
      begin: 0.0, end: 70.0
    ).animate(CurvedAnimation(
      parent: animationController, 
      curve: Curves.easeIn
    ));

    var mouseOn = useState<bool>(false);

    return MouseRegion(
      onHover: (_) {
        if (!animationController.isAnimating) {
          animationController.forward();
          mouseOn.value = true;
        }
      },
      onExit: (_) {
        if (!animationController.isAnimating) {
          animationController.reverse();
          mouseOn.value = false;
        }
      },
      child: CustomCard(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: ButtonBackgroundColor(context),
            overlayColor: ButtonBackgroundColor(context),
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(Spacing.x2)
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide.none
              )
            )
          ),
          child: Row(
            children: [
              const Icon(
                Icons.add,
                color: Colors.white
              ),
              AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget? child) {  
                  return SizedBox(
                    height: 20,
                    width: animation.value,
                    child: AnimatedOpacity(
                      opacity: mouseOn.value ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        'Escolher', 
                        style: TextStyles.medium(color: Colors.white)
                      ),
                    ) ,
                  );
                },
               
              )
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}