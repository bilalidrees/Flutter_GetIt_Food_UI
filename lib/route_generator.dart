import 'package:flutter/material.dart';
import 'package:foody_yo/presentation/pages/cart_page/cart_page.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/pages/location_walk_through/location_walk_through.dart';
import 'package:foody_yo/presentation/pages/login_signup/login_signup.dart';
import 'package:foody_yo/presentation/pages/main_page/apply_a_voucher_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/address_page/address_edit_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/challenge_reward_page/challenge_reward_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/favourite_page/favourite_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/help_center_page/cancel_order_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/help_center_page/help_center_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/order_page/order_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/profile_page/profile_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/setting_page/setting_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/term_and_cond_page/terms_cond_page.dart';
import 'package:foody_yo/presentation/pages/main_page/drawer/drawer_item_page/voucher_page/voucher_page.dart';
import 'package:foody_yo/presentation/pages/main_page/check_out_page.dart';
import 'package:foody_yo/presentation/pages/main_page/filter_page/filter_page.dart';
import 'package:foody_yo/presentation/pages/main_page/main_layout.dart';
import 'package:foody_yo/presentation/pages/main_page/payment_method_page.dart';
import 'package:foody_yo/presentation/pages/main_page/rating_page/rating_page.dart';
import 'package:foody_yo/presentation/pages/main_page/your_order/your_order_page.dart';
import 'package:foody_yo/presentation/pages/map_page/map_page.dart';
import 'package:foody_yo/presentation/pages/welcome/welcome_page.dart';
import 'constants/route_string.dart';
import 'presentation/pages/main_page/drawer/drawer_item_page/address_page/address_page.dart';
import 'presentation/pages/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteString.initial:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
        return MaterialPageRoute(builder: (context) => const WelcomePage());
        return MaterialPageRoute(
            builder: (context) => const LocationWalkThrough());
      case RouteString.walkThrough:
        return MaterialPageRoute(
            builder: (context) => const LocationWalkThrough());
      case RouteString.map:
        // Validation of correct data type
        if (args is bool) {
          return MaterialPageRoute(
            builder: (_) => const MapPage(),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case RouteString.welcome:
        return MaterialPageRoute(builder: (context) => const WelcomePage());
      case RouteString.main:
        return MaterialPageRoute(
            builder: (context) => MainLayout(args as TempAuth));
      case RouteString.loginOrSignUp:
        return MaterialPageRoute(builder: (context) => const LoginORSignup());
      case RouteString.helpCenter:
        return MaterialPageRoute(builder: (context) => const HelpCenterPage());
      case RouteString.cancelOrder:
        return MaterialPageRoute(builder: (context) => const CancelOrderPage());
      case RouteString.orderHistory:
        return MaterialPageRoute(builder: (context) => const OrderPage());
      case RouteString.voucher:
        return MaterialPageRoute(builder: (context) => const VoucherPage());
      case RouteString.challengeAndReward:
        return MaterialPageRoute(
            builder: (context) => const ChallengeAndRewardPage());
      case RouteString.favourite:
        return MaterialPageRoute(builder: (context) => const FavouritePage());
      case RouteString.address:
        return MaterialPageRoute(builder: (context) => const AddressPage());
      case RouteString.addressEdit:
        return MaterialPageRoute(builder: (context) => const AddressEditPage());
      case RouteString.settings:
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      case RouteString.termAndCondition:
        return MaterialPageRoute(
            builder: (context) => const TermsAndCondition());

      case RouteString.profile:
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      case RouteString.applyAVoucher:
        return MaterialPageRoute(builder: (context) => const ApplyAVoucher());
      case RouteString.cart:
        return MaterialPageRoute(builder: (context) => const CardPage());
      case RouteString.checkOut:
        return MaterialPageRoute(builder: (context) => const CheckOutPage());
      case RouteString.paymentMethod:
        return MaterialPageRoute(
            builder: (context) => const PaymentMethodPage());
      case RouteString.yourOrder:
        return MaterialPageRoute(builder: (context) => const YourOrderPage());
      case RouteString.filter:
        return MaterialPageRoute(builder: (context) => const FilterPage());
      case RouteString.rating:
        return MaterialPageRoute(builder: (context) => const RatingPage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

// class RouteObservers {
//   static RouteObserver<dynamic> routeObserver = RouteObserver<PageRoute>();
// }
// class RouteAwareWidget extends StatefulWidget {
//   final String name;
//   final Widget? child;
//   const RouteAwareWidget(this.name,{Key? key,required this.child}) : super(key: key);
//
//   @override
//   State<RouteAwareWidget> createState() => RouteAwareWidgetState();
// }
//
// class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     RouteObservers.routeObserver.subscribe(this, ModalRoute.of(context));
//   }
//
//   @override
//   void dispose() {
//     RouteObservers.routeObserver.unsubscribe(this);
//     super.dispose();
//   }
//
//   @override
//   void didPush() {
//     print('didPush ${widget.name}');
//     // App.rootContext = context;
//   }
//
//   @override
//   // Called when the top route has been popped off, and the current route shows up.
//   void didPopNext() {
//     print('didPopNext ${widget.name}');
//     // App.rootContext = context;
//   }
//
//   @override
//   Widget build(BuildContext context) => widget.child!;
// }
//
// class ScreenArguments<T> {
//   final int? tab;
//   final Widget? currentPage;
//   final String? message;
//   final bool? flag;
//   final T? data;
//   final T? secondData;
//
//   ScreenArguments(
//       {this.tab,
//         this.currentPage,
//         this.message,
//         this.data,
//         this.secondData,
//         this.flag});
// }
