import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({@required this.onPressed, this.rotation = 0, this.showIcon = true});

  final onPressed;
  final int rotation;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: rotation,
      child: RawMaterialButton(
        onPressed: null,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showIcon
                  ? Icon(
                      Icons.explore,
                      color: Colors.tealAccent,
                    )
                  : Text(''),
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        fillColor: Colors.teal,
        splashColor: Colors.green,
        // onPressed: onPressed,
        shape: const StadiumBorder(),
      ),
    );
  }
}
