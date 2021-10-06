import 'package:admin/constants.dart';
import 'package:admin/models/faqs.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../responsive.dart';

class FAQsScreen extends StatefulWidget {
  FAQsScreen({Key? key}) : super(key: key);

  @override
  _FAQsScreenState createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final List<FAQs> list = [
    FAQs(
      'this is a question',
      answer:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dui s aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sintoccaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporrincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dowLorem ipsum dolor sitamet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitatincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
      suggestions: [
        FAQs('this is a question', answer: 'this is an answer'),
        FAQs('this is a question', answer: 'this is an answer'),
        FAQs('this is a question', answer: 'this is an answer'),
        FAQs('this is a question', answer: 'this is an answer'),
      ],
    ),
    FAQs('this is a question', answer: 'this is an answer'),
    FAQs('this is a question', answer: 'this is an answer'),
  ];

  final searchCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchHeader(searchCon: searchCon),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 20),
            child: Column(
              children: list.map((e) => ExpandableItem(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandableItem extends StatefulWidget {
  final FAQs faQs;
  Color? color;
  ExpandableItem(
    this.faQs, {
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<ExpandableItem> createState() => _ExpandableItemState();
}

class _ExpandableItemState extends State<ExpandableItem> {
  bool isClose = true;
  final controller = ExpandableController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        isClose = !isClose;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ExpandablePanel(
              controller: controller,
              theme: ExpandableThemeData(
                tapHeaderToExpand: true,
                tapBodyToExpand: true,
                hasIcon: false,
                alignment: Alignment.center,
              ),
              header: SizedBox(
                height: widget.color != null
                    ? MediaQuery.of(context).size.height * 0.075
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    color: widget.color ?? primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:12.0),
                      child: ListTile(
                        leading: Text(
                          widget.faQs.question,
                          style: TextStyle(
                            fontSize: widget.color == null ? 18 : 16,
                            color: widget.color == null
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        trailing: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: widget.color == null
                                  ? Colors.white
                                  : Colors.grey,
                              border: Border.all(
                                color: widget.color == null
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                          child: Icon(
                            isClose
                                ? Icons.keyboard_arrow_down_rounded
                                : Icons.keyboard_arrow_right_rounded,
                            color: widget.color == null
                                ? Colors.black
                                : Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              collapsed: SizedBox(),
              expanded: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${widget.faQs.answer ?? 'there is no answer yet'}',
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    if (widget.faQs.suggestions != null)
                      Column(
                        children: widget.faQs.suggestions!
                            .map(
                              (e) => ExpandableItem(
                                e,
                                color: Colors.grey.shade400.withOpacity(0.4),
                              ),
                            )
                            .toList(),
                      ),
                  ],
                ),
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    Key? key,
    required this.searchCon,
  }) : super(key: key);

  final TextEditingController searchCon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      height: (MediaQuery.of(context).size.height / 100) * 40,
      child: Padding(
          padding: EdgeInsets.only(top: 30),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 45.0,
            horizontal: Responsive.isMobile(context)
                ? 26
                : MediaQuery.of(context).size.width * 0.183,
          ),
          child: Stack(
            children: [
              //Image.asset('name'),
              Column(
                children: [
                  Text(
                    'How may we help you?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: TextField(
                      controller: searchCon,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.manage_search_rounded,
                            color: Colors.white,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.4),
                        hintText: 'I have a question about...',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      onSubmitted: (_) {},
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: Responsive.isMobile(context)
                        ? 16
                        : MediaQuery.of(context).size.width * 0.025,
                    runSpacing: Responsive.isMobile(context) ? 14 : 0,
                    children: [
                      SuggestionSearch(
                        'How it works?',
                        onTap: () {},
                      ),
                      SuggestionSearch(
                        'How to craete a new policy?',
                        onTap: () {},
                      ),
                      SuggestionSearch(
                        'How to link a device?',
                        onTap: () {},
                      ),
                      SuggestionSearch(
                        'What is policy?',
                        onTap: () {},
                      ),
                      SuggestionSearch(
                        'How to add members?',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuggestionSearch extends StatelessWidget {
  const SuggestionSearch(this.text, {Key? key, this.onTap}) : super(key: key);

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(color: Colors.white38),
      ),
    );
  }
}
