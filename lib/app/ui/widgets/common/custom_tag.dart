import 'package:flutter/material.dart';

import 'text.dart';

class CustomTagInput extends StatefulWidget {
  const CustomTagInput(
      {super.key, required this.controller, required this.tags});

  final TextEditingController controller;
  final List<String> tags;

  @override
  State<CustomTagInput> createState() => _CustomTagInputState();
}

class _CustomTagInputState extends State<CustomTagInput> {
  void _addTag(String tag) {
    if (tag.isNotEmpty && !widget.tags.contains(tag)) {
      setState(() {
        widget.tags.add(tag);
      });
      widget.controller.clear();
    }
  }

  void _removeTag(String tag) {
    setState(() {
      widget.tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CommonText(
              text: "these domains",
              fontColor: Theme.of(context).hintColor,
              fontWeight: FontWeight.w300,
              fontFamily: 'regular',
            ),
            const SizedBox(width: 15),
            Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  labelText: "add domains",
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onSubmitted: (value) {
                  _addTag(value);
                  print("tas ${widget.tags}");
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Wrap(
          spacing: 8.0,
          children: widget.tags.map((tag) {
            return Chip(
              label: CommonText(text: tag),
              onDeleted: () => _removeTag(tag),
            );
          }).toList(),
        ),
      ],
    );
  }
}
