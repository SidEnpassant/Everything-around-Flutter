import 'package:flutter/material.dart';
import 'package:testapp/widgets_and_UI/search_bar/search_bar_widget.dart';
import 'package:testapp/widgets_and_UI/segmented_button/segmented_button_widget.dart';

import 'NavigationDrawerDemo/NavigationDrawerDemo.dart';
import 'badge/badge_widget.dart';
import 'carousel/carousel_widget.dart';
import 'dropdown_menu/DropDownMenuDemo.dart';
import 'menu_anchor_menu_bar/menu_anchor_widget.dart';
import 'navigation_bar_widget/navigation_bar.dart';

class NewWidgetsScreen extends StatefulWidget {
  const NewWidgetsScreen({super.key});

  @override
  State<NewWidgetsScreen> createState() => _NewWidgetsScreenState();
}

class _NewWidgetsScreenState extends State<NewWidgetsScreen> {

  int selectedIndex = 0;
  int drawerSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerDemo(
        selectedIndex: drawerSelectedIndex,
        onDestinationSelected: (final int index){
          setState(() {
            drawerSelectedIndex = index;
          });
        },
      ),
      appBar: AppBar(
        title: const Text('New Flutter Widgets'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: BadgeWidget(count: 8, child: Icon(Icons.notifications)),
          ),
          MenuAnchorDemo(
            menuChildren: [
              MenuItemButton(
                leadingIcon: Icon(Icons.message),
                child: Text('New Chat'),
                onPressed: () {},
              ),
              MenuItemButton(
                leadingIcon: Icon(Icons.person_add),
                child: Text('New Contact'),
                onPressed: () {},
              ),
              SubmenuButton(
                menuChildren: [
                  MenuItemButton(onPressed: () {}, child: Text('Email')),
                  MenuItemButton(onPressed: () {}, child: Text('WhatsApp')),
                  MenuItemButton(onPressed: () {}, child: Text('Twitter')),
                  MenuItemButton(onPressed: () {}, child: Text('Telegram')),
                ],
                leadingIcon: Icon(Icons.share_rounded),
                child: Text('Share'),
              ),
              MenuItemButton(
                leadingIcon: Icon(Icons.settings),
                child: Text('Settings'),
                onPressed: () {},
              ),
            ],
          ),
        ],
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: BadgeDemo(child: Icon(Icons.menu)),
        // ),
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 16.0,
          children: [
            SearchBarWidget(),
            CarouselWidget(),
            Divider(),
            Column(
              spacing: 8.0,
              children: [Text('Single choice'), SingleChoice()],
            ),
            Column(
              spacing: 8.0,
              children: [Text('Multiple choice'), MultipleChoice()],
            ),
            Divider(),

            Divider(),
            Text('Selection Area'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SelectionArea(
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Divider(),
            DropDownMenuDemo(
              onSelected: (final int? value) {},
              items:
              ['English', 'German', 'French', 'Spanish', 'Arabic']
                  .asMap()
                  .entries
                  .map(
                    (final MapEntry<int, String> item) =>
                    DropdownMenuEntry<int>(
                      value: item.key + 1,
                      label: item.value,
                    ),
              )
                  .toList(),
              width: context.dependOnInheritedWidgetOfExactType(),
              leadingIcon: Icons.language,
              child: Text('Select language'),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarDemo(
        onDestinationSelected: (final int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
      ),
    );
  }
}