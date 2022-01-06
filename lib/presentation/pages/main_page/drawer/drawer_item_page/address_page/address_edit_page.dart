import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/presentation/pages/enums.dart';
import 'package:foody_yo/presentation/theme/app_color.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressEditPage extends StatefulWidget {
  const AddressEditPage({Key? key}) : super(key: key);

  @override
  State<AddressEditPage> createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
    super.initState();
  }

  Widget knob() => Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: 8,
        width: 60,
        decoration: BoxDecoration(
            color: AppColor.mainGreen, borderRadius: BorderRadius.circular(10)),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            GoogleMap(
              markers: {
                const Marker(
                  markerId: MarkerId('SomeId'),
                  position: LatLng(37.43296265331129, -122.08832357078792),
                ),
              },
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.3,
                  maxChildSize: 0.7,
                  minChildSize: 0.3,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: CustomScrollView(
                        scrollDirection: Axis.vertical,
                        controller: scrollController,
                        slivers: [
                          SliverList(
                              delegate: SliverChildListDelegate([
                            Column(
                              children: [
                                knob(),
                                Row(
                                  children: [
                                    const SimpleText(
                                      AppString.editYourAddress,
                                      enumText: EnumText.extraBold,
                                      fontSize: 24,
                                    ),
                                    const Spacer(),
                                    ActionChip(
                                        pressElevation: 1,
                                        labelPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 15),
                                        label:
                                            const SimpleText(AppString.apply),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ),
                                // const Align(
                                //     alignment: Alignment.centerLeft,
                                //     child: SimpleText(
                                //       AppString.editYourAddress,
                                //       enumText: EnumText.extraBold,
                                //       fontSize: 24,
                                //     )),
                                const LabeledTextField(
                                  labelText: AppString.street,
                                ),
                                const LabeledTextField(
                                  labelText: AppString.floor,
                                ),
                                const LabeledTextField(
                                  labelText: AppString.note,
                                ),
                                const Align(
                                    alignment: Alignment.centerLeft,
                                    child: SimpleText(
                                      AppString.addALabel,
                                      enumText: EnumText.extraBold,
                                      fontSize: 24,
                                    )),
                                const LabeledTextField(
                                  labelText: AppString.note,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Wrap(
                                    spacing: 25,
                                    runSpacing: 10,
                                    children: const [
                                      ChoiceChipWidget(AppString.home, false),
                                      ChoiceChipWidget(AppString.work, false),
                                      ChoiceChipWidget(
                                          AppString.partner, false),
                                      ChoiceChipWidget(
                                          AppString.partner, false),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ])),
                        ],
                      ),
                    );
                  }),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   heightFactor: 11.8,
            //   child: BigButton(
            //     height: 75,
            //     onPressed: () {},
            //     text: AppString.apply,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ChoiceChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ChoiceChipWidget(this.label, this.isSelected, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        padding: const EdgeInsets.all(8),
        selectedColor: AppColor.mainGreen.withOpacity(0.45),
        label: SimpleText(label),
        selected: isSelected);
  }
}

class LabeledTextField extends StatelessWidget {
  final String? labelText;

  const LabeledTextField({Key? key, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
          decoration: InputDecoration(
        enabled: false,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: labelText,
      )),
    );
  }
}

class LabelModel {
  final IconData icon;
  final String title;

  const LabelModel(this.title, this.icon);

  static const List<LabelModel> list = [
    LabelModel('Home', Icons.home_outlined),
    LabelModel('Work', Icons.work_outline),
    LabelModel('Partner', Icons.favorite_outline),
  ];
}

class LabelWidget extends StatelessWidget {
  final IconData iconData;
  final String title;

  const LabelWidget(this.title, this.iconData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3), color: Colors.black26, blurRadius: 3)
              ],
              shape: BoxShape.circle),
          child: Icon(iconData),
        ),
        SimpleText(title),
      ],
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late BorderRadiusTween borderRadius;
//   Duration _duration = Duration(milliseconds: 500);
//   Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
//   double min = 0.1, initial = 0.3, max = 0.7;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: _duration);
//     borderRadius = BorderRadiusTween(
//       begin: BorderRadius.circular(75.0),
//       end: BorderRadius.circular(0.0),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: GestureDetector(
//         child: FloatingActionButton(
//           child: AnimatedIcon(
//               icon: AnimatedIcons.menu_close, progress: _controller),
//           elevation: 5,
//           backgroundColor: Colors.deepOrange,
//           foregroundColor: Colors.white,
//           onPressed: () async {
//             if (_controller.isDismissed)
//               _controller.forward();
//             else if (_controller.isCompleted) _controller.reverse();
//           },
//         ),
//       ),
//       body: SizedBox.expand(
//         child: Stack(
//           children: <Widget>[
//             FlutterLogo(size: 500),
//             SizedBox.expand(
//               child: SlideTransition(
//                 position: _tween.animate(_controller),
//                 child: DraggableScrollableSheet(
//                   minChildSize: min,
//                   // 0.1 times of available height, sheet can't go below this on dragging
//                   maxChildSize: max,
//                   // 0.7 times of available height, sheet can't go above this on dragging
//                   initialChildSize: initial,
//                   // 0.1 times of available height, sheet start at this size when opened for first time
//                   builder: (BuildContext context, ScrollController controller) {
//                     return AnimatedBuilder(
//                       animation: controller,
//                       builder: (context, child) {
//                         return ClipRRect(
//                           borderRadius: borderRadius.evaluate(CurvedAnimation(
//                               parent: _controller, curve: Curves.ease)),
//                           child: Container(
//                             height: 500.0,
//                             color: Colors.blue[800],
//                             child: ListView.builder(
//                               controller: controller,
//                               itemCount: 5,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return ListTile(title: Text('Item $index'));
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// GoogleMap(
// markers: {
// const Marker(
// markerId: MarkerId('SomeId'),
// position: LatLng(37.43296265331129, -122.08832357078792),
// ),
// },
// zoomControlsEnabled: false,
// mapType: MapType.normal,
// initialCameraPosition: _kGooglePlex,
// onMapCreated: (GoogleMapController controller) {
// _controller.complete(controller);
// },
// ),
