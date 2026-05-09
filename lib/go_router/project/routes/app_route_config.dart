import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/error_page.dart';
import '../../pages/routes_about.dart';
import '../../pages/routes_contact_us.dart';
import '../../pages/routes_home.dart';
import '../../pages/routes_profile.dart';
import 'app_route_constants.dart';

class MyAppRouter{


  static GoRouter returnRouter(bool isAuth){
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
            name: MyAppRouteConstants.homeRouteName,
            path: '/',
            pageBuilder: (context,state){
              return MaterialPage(child: RoutesHome());
            }
        ),
        GoRoute(
            name: MyAppRouteConstants.profileRouteName,
            path: '/profile/:username',
            pageBuilder: (context,state){
              return MaterialPage(child: RoutesProfile(username: state.pathParameters['username']!,));
            }
        ),
        GoRoute(
            name: MyAppRouteConstants.aboutRouteName,
            path: '/about',
            pageBuilder: (context,state){
              return MaterialPage(child: RoutesAbout());
            }
        ),
        GoRoute(
            name: MyAppRouteConstants.contactUsRouteName,
            path: '/contact_us',
            pageBuilder: (context,state){
              return MaterialPage(child: RoutesContactUs());
            }
        ),
      ],
      errorPageBuilder: (context , state){
        return MaterialPage(child: ErrorPage());
      },
      redirect: (context, state) {
       
        if(!isAuth && state.matchedLocation.startsWith('/${MyAppRouteConstants.profileRouteName}')){
        return context.namedLocation(MyAppRouteConstants.contactUsRouteName);
        }else{
          return null;
        }
      },
    );
    return router;
  }

}