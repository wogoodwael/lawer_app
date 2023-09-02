// ignore_for_file: must_be_immutable

import 'package:countries_flag/countries_flag.dart';
import 'package:flutter/material.dart';
import 'package:law_app/core/constants/colors.dart';
import 'package:law_app/widgets/countries.dart';
import 'package:law_app/widgets/dialog.dart';
import 'package:law_app/widgets/law_container.dart';



class CoutriesScreen extends StatelessWidget {
  CoutriesScreen({super.key});
  LawerDetails lawerDetails = LawerDetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.text_color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "اختر الدولة ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.menu_book_sharp,
                  color: Colors.white,
                )
              ],
            ),
            Container(
              width: 400,
              height: 650,
              decoration: const BoxDecoration(color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    RowCountries(
                      flagName: Flags.egypt,
                      countryname: 'مصر',
                      ontap: () {
                        DialogP().dialogBuilderlawer(context,
                            lawerDetails.names[0], lawerDetails.phones[0]);
                      },
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.saudiArabia,
                      countryname: 'المملكة العربية السعودية ',
                      ontap: () {
                        DialogP().dialogBuilderlawers(
                          context,
                          lawerDetails.sudia_names,
                          lawerDetails.sudia_phone,
                        );
                      },
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.kuwait,
                      countryname: 'الكويت',
                      ontap: () {
                        DialogP().dialogBuilderlawers(
                            context,
                            lawerDetails.kuait_names,
                            lawerDetails.kuait_phones);
                      },
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.algeria,
                      countryname: 'الجزائر',
                      ontap: () {
                        DialogP().dialogBuilderlawer(context,
                            lawerDetails.names[1], lawerDetails.phones[1]);
                      },
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.unitedArabEmirates,
                      countryname: 'الامارات',
                      ontap: () {
                        DialogP().dialogBuilderlawers(
                            context,
                            lawerDetails.imarat_names,
                            lawerDetails.imarat_phones);
                      },
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.qatar,
                      countryname: 'قطر ',
                      ontap: () {
                        DialogP().dialogBuilderlawer(
                          context,
                          lawerDetails.names[2],
                          lawerDetails.phones[2],
                        );
                      },
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.oman,
                      countryname: 'عمان',
                      ontap: () {},
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.djibouti,
                      countryname: 'باكستان',
                      ontap: () {},
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.russia,
                      countryname: 'روسيا',
                      ontap: () {},
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.sweden,
                      countryname: 'السويد',
                      ontap: () {},
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.sudan,
                      countryname: 'السودان',
                      ontap: () {},
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.unitedStatesOfAmerica,
                      countryname: 'الولايات المتحده الامريكيه',
                      ontap: () {},
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.afghanistan,
                      countryname: 'افغانستان',
                      ontap: () {},
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    RowCountries(
                      flagName: Flags.african,
                      countryname: 'افريقيا',
                      ontap: () {},
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
