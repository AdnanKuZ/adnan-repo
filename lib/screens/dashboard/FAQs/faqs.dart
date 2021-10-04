import 'package:admin/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../responsive.dart';

class FAQsScreen extends StatefulWidget {
  FAQsScreen({Key? key}) : super(key: key);

  @override
  _FAQsScreenState createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final searchCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchHeader(searchCon: searchCon),
          SizedBox(height: 20),
          
        ],
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
      height: (MediaQuery.of(context).size.height / 100) * 46,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 35.0,
          horizontal: Responsive.isMobile(context) ? 26 : 100,
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
                  spacing: 16,
                  runSpacing: 14,
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
