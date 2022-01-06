import 'package:flutter/material.dart';
import 'package:foody_yo/constants/app_string.dart';
import 'package:foody_yo/constants/route_string.dart';
import 'package:foody_yo/presentation/widgets/big_button.dart';
import 'package:foody_yo/presentation/widgets/simple_appbar.dart';
import 'package:foody_yo/presentation/widgets/simple_text.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const SimpleAppBar(title: AppString.address),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
           AddressTile(onTap: (){
             Navigator.pushNamed(context, RouteString.addressEdit);
           },),
          const Divider(
            thickness: 2,
            endIndent: 20,
            indent: 20,
          ),
          const   Spacer(flex: 8),
          BigButton(text: 'Add New Address', onPressed: (){
            Navigator.pushNamed(context, RouteString.addressEdit);
          }),
          const   Spacer(),
        ],
      ),
    ));
  }
}

class AddressTile extends StatelessWidget {
  final void Function()? onTap;
  const AddressTile({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: ListTile(
        onTap: onTap,
        leading: const Icon(Icons.location_on),
        title: Row(
          children: const [
            Expanded(
              child: Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            Icon(Icons.edit_outlined),
            Icon(Icons.delete_outline),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SimpleText('Karachi'),
            SimpleText('Note To Rider: fayyaz Center')
          ],
        ),
      ),
    );
  }
}
