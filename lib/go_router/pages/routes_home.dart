import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../project/routes/app_route_constants.dart';

class RoutesHome extends StatelessWidget {
  const RoutesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text('HOME'),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                GoRouter.of(context).pushNamed(MyAppRouteConstants.aboutRouteName);
              },
              child: Text('About Page')
          ),
          ElevatedButton(
              onPressed: (){
                GoRouter.of(context).pushNamed(MyAppRouteConstants.profileRouteName,
                    pathParameters: {
                  'username': 'Siddhes Das',
                  }
                );
              },
              child: Text ('Profile Page')
          ),
          ElevatedButton(
              onPressed: (){
                GoRouter.of(context).pushNamed(MyAppRouteConstants.contactUsRouteName);
              },
              child: Text('Contact Us Page')
          )
        ],
      ),
    );
  }
}

