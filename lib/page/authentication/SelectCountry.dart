import 'package:aidiva_pro/components/CustomColors.dart';
import 'package:aidiva_pro/components/customtextstyle.dart';
import 'package:aidiva_pro/model/CountryData.dart';
import 'package:aidiva_pro/model/Lookupmodel/CountryLookupResponse.dart';
import 'package:aidiva_pro/provider/LookupProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountry createState() => _SelectCountry();
}

class _SelectCountry extends State<SelectCountry> {

  List<Datum> _searchResult = [];

  List<Datum> _countryDetails = [];

  TextEditingController country = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double device_width = MediaQuery.of(context).size.width;
    double device_height = MediaQuery.of(context).size.height;

    var lookupprovider = Provider.of<LookupProvider>(context, listen: true);


    // TODO: implement build
    return Material(
        color: Primarycolor,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child:
                                Icon(Icons.arrow_back_ios, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: device_width * 0.9,
                          child: TextFormField(

                            controller: country,
                            onChanged: onSearchTextChanged,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              isDense: true,
                              prefixIcon: IconButton(
                                splashColor: Colors.transparent,
                                icon: Icon(Icons.search),
                                onPressed: () {
                                  setState(() {
                                    // showpassword = !showpassword;
                                  });
                                },
                              ),
                              labelText: 'Search by country name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: device_height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: device_width * 0.9,
                          child: Text(
                            'Select Your Country',
                            style: CustomTextStyle.contenetsixteen(context),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Container(
                            width: device_width * 0.9,
                            child: _searchResult.length != 0 || country.text.isNotEmpty
                                ? new ListView.builder(
                              itemCount: _searchResult.length,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(
                                          context,
                                          new CountryData(
                                              _searchResult[index]
                                                  .mastLookupKey,
                                              _searchResult[index]
                                                  .mastLookupValue,
                                              _searchResult[index]
                                                  .mastLookupType));
                                    },
                                    child: ListTile(
                                        leading: Icon(Icons.flag),
                                        trailing: Text(
                                          "+" +
                                              _searchResult[index]
                                                  .mastLookupKey,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15),
                                        ),
                                        title: Text(_searchResult[index]
                                            .mastLookupValue)),
                                  ),
                                  Divider(),
                                ]);
                              },
                            ):ListView.builder(
                                itemCount: lookupprovider
                                    .countryLookupResponse.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(
                                            context,
                                            new CountryData(
                                                lookupprovider
                                                    .countryLookupResponse
                                                    .data[index]
                                                    .mastLookupKey,
                                                lookupprovider
                                                    .countryLookupResponse
                                                    .data[index]
                                                    .mastLookupValue,
                                                lookupprovider
                                                    .countryLookupResponse
                                                    .data[index]
                                                    .mastLookupType));
                                      },
                                      child: ListTile(
                                          leading: Icon(Icons.flag),
                                          trailing: Text(
                                            "+" +
                                                lookupprovider
                                                    .countryLookupResponse
                                                    .data[index]
                                                    .mastLookupKey,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 15),
                                          ),
                                          title: Text(lookupprovider
                                              .countryLookupResponse
                                              .data[index]
                                              .mastLookupValue)),
                                    ),
                                    Divider(),
                                  ]);
                                })))
                  ],
                ))));
  }

  @override
  void initState() {
    // _countryDetails=Provider.of<LookupProvider>(context, listen: true)
    //     .countryLookupResponse.data;
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    Provider.of<LookupProvider>(context, listen: false).countryLookupResponse.data.forEach((userDetail) {
      if (userDetail.mastLookupValue.toLowerCase().contains(text.toLowerCase()) || userDetail.mastLookupKey.toLowerCase().contains(text.toLowerCase()))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}


