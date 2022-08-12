import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double valueProgress = 86;

  const CustomProgressBar({
    Key? key,
    valueProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                minHeight: 8,
                backgroundColor: const Color(0xffE3E3E3),
                valueColor: (valueProgress / 100 <= 0.4)
                    ? const AlwaysStoppedAnimation(Colors.red)
                    : (valueProgress / 100 > 0.4 && valueProgress / 100 <= 0.85)
                        ? const AlwaysStoppedAnimation(Colors.orange)
                        : const AlwaysStoppedAnimation(Colors.green),
                value: valueProgress / 100,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '${valueProgress.toString()}%',
            style: TextStyle(color: Color(0xff9D9D9D), fontSize: 12),
          )
        ],
      ),
    );
  }
}
