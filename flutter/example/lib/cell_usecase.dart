import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:yaki_ui/cell.dart';
import 'package:yaki_ui/yaki_ui.dart';

@widgetbook.UseCase(
  name: 'Cell with chips',
  type: Cell,
)
Widget cellWithChips(BuildContext context) {
  return Center(
    child: Cell(
      title: context.knobs.string(
        label: 'Title',
        description: 'The title of the card',
        initialValue: 'Yaki card',
      ),
      subtitle: context.knobs.string(
        label: 'Subtitle',
        description: 'The subtitle of the card',
        initialValue: 'Yaki subtitle',
      ),
      image: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          image: const DecorationImage(
            image: NetworkImage(
              'https://picsum.photos/200/300',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      chips: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage(
              "assets/twitch_logo.png",
            ),
          ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage(
              "assets/twitch_logo.png",
            ),
          ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconChip(
                image: const CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(
                    "assets/twitch_logo.png",
                  ),
                ),
                label: context.knobs.string(
                  label: 'First chip',
                  description: 'The title of the first chip',
                  initialValue: 'Auchan',
                ),
                backgroundColor: Colors.grey.shade300,
              ),
              const SizedBox(
                width: 5,
              ),
              IconChip(
                image: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: context.knobs.string(
                  label: 'Second chip',
                  description: 'The title of the second chip',
                  initialValue: 'En télétravail',
                ),
                backgroundColor: Colors.orange.shade200,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconChip(
                image: const CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(
                    "assets/twitch_logo.png",
                  ),
                ),
                label: context.knobs.string(
                  label: 'First chip',
                  description: 'The title of the first chip',
                  initialValue: 'Auchan',
                ),
                backgroundColor: Colors.grey.shade300,
              ),
              const SizedBox(
                width: 5,
              ),
              IconChip(
                image: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: context.knobs.string(
                  label: 'Second chip',
                  description: 'The title of the second chip',
                  initialValue: 'En télétravail',
                ),
                backgroundColor: Colors.orange.shade200,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
