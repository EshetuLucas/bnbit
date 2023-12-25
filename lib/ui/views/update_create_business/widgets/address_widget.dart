import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  AddressWidget({super.key, 
    required this.address,
  });
  final Address address;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                address.displayAddress,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Divider(
              color: kcDark700Light.withOpacity(0.3),
            ),
            verticalSpaceTiny,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: ktsSmall(context).copyWith(
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        address.phone_number ?? '',
                        style: ktsSmall(context).copyWith(
                          fontSize: 11,
                          color: kcDarkGrey.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                horizontalSpaceSmall,
                if (address.label != null)
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Lable',
                            style: ktsSmall(context).copyWith(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            address.label ?? '_____',
                            style: ktsSmall(context).copyWith(
                              fontSize: 11,
                              color: kcDarkGrey.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            verticalSpaceTiny,
          ],
        ),
      ),
    );
  }
}
