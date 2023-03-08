import 'package:flutter/material.dart';

import '../../../data/models/character_model.dart';
import 'footer_detail_widget.dart';

class DetailItemWidget extends StatefulWidget {
  const DetailItemWidget(this.character, {super.key});
  final List<Character> character;

  @override
  State<DetailItemWidget> createState() => _DetailItemWidgetState();
}

class _DetailItemWidgetState extends State<DetailItemWidget> {
  late Character favoriteItem;
  final isSlected = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    favoriteItem = widget.character.first;
    isSlected.value = favoriteItem.id;
  }

  @override
  void dispose() {
    isSlected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.character.length,
            itemBuilder: (context, index) {
              var item = widget.character[index];
              return GestureDetector(
                onTap: () {
                  isSlected.value = item.id;
                  favoriteItem = item;
                  setState(() {});
                },
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ValueListenableBuilder(
                            valueListenable: isSlected,
                            builder: (_, int value, __) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                height: value == item.id ? 100 : 80,
                                width: value == item.id ? 100 : 80,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.green.withOpacity(0.8),
                                      width: value == item.id ? 5.0 : 0.0),
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: NetworkImage(item.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              );
            },
          ),
        ),
        FooterDetailWidget(favoriteItem)
      ],
    );
  }
}
