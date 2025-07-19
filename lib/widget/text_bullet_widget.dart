import 'package:flutter/material.dart';

class TickmarkList extends StatelessWidget {
  final List<String> items;

  const TickmarkList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items.map((item) {
          List<String> parts = item.split(':');
          String keyword = parts.first;
          String remainingText =
              parts.length > 1 ? parts.sublist(1).join(':') : '';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$keyword ',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'JameelNoori',
                          ),
                        ),
                        TextSpan(
                          text: remainingText,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'JameelNoori',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.check, size: 20, color: Colors.black),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: '\u25CF ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: item,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'JameelNoori',
                          ),
                        ),
                      ],
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class WrongmarkList extends StatelessWidget {
  final List<String> items;

  const WrongmarkList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: items.map((item) {
          List<String> parts = item.split(':');
          String keyword = parts.first;
          String remainingText =
              parts.length > 1 ? parts.sublist(1).join(':') : '';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$keyword ',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'JameelNoori',
                          ),
                        ),
                        TextSpan(
                          text: remainingText,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'JameelNoori',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.close, size: 20, color: Colors.red),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
