import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:safe_bump/presentation/viewmodel/hospital_viewmodel.dart';
import 'package:safe_bump/presentation/widgets/custom_text_field.dart';
import 'package:safe_bump/presentation/widgets/safe_bump_app_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalView extends StatefulWidget {
  const HospitalView({Key? key}) : super(key: key);

  @override
  State<HospitalView> createState() => _HospitalViewState();
}

class _HospitalViewState extends State<HospitalView> {
  Completer<GoogleMapController> _controller = Completer();
  Position? _currentPosition;
  LatLng _center = LatLng(45.521563, -122.677433);
  Set<Marker> _markers = {};

  Position? get currentPosition => _currentPosition;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HospitalViewModel>(
      builder: (context, hospitalViewModel, child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SafeBumpAppBar(
            // leadingWidget: Icon(Icons.menu_rounded),
            trailingWidget: Icon(Icons.more_vert),
            title: "Hospitals"),
        body: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          markers: _markers,
          myLocationEnabled: true,
          mapToolbarEnabled: false,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.search),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  builder: (context) => Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Your Location",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                IconButton(
                                    onPressed: () async {
                                      getUserCurrentLocation()
                                          .then((value) async {
                                        var cameraPosition = new CameraPosition(
                                            target: LatLng(value.latitude,
                                                value.longitude),
                                            zoom: 14);

                                        _markers.add(Marker(
                                            markerId: MarkerId('Home'),
                                            position: LatLng(value.latitude,
                                                value.longitude)));
                                        final GoogleMapController controller =
                                            await _controller.future;
                                        controller.animateCamera(
                                            CameraUpdate.newCameraPosition(
                                                cameraPosition));
                                        hospitalViewModel.getHospitalList(
                                            LatLng(value.latitude,
                                                value.longitude));
                                        setState(() {});
                                      });
                                    },
                                    icon: Icon(Icons.location_searching))
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            CustomTextField(
                                controller: TextEditingController(),
                                hint: "Search Hospitals"),
                            SizedBox(
                              height: 1.h,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: hospitalViewModel.hospital == null
                                      ? 0
                                      : hospitalViewModel
                                          .hospital?.results.length,
                                  itemBuilder: (context, index) {
                                    print(hospitalViewModel
                                        .hospital?.results[index]
                                        .toJson());
                                    return Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            Placeholder(
                                              fallbackWidth: 50,
                                              fallbackHeight: 50,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 50.w,
                                                  child: Text(
                                                    (hospitalViewModel
                                                            .hospital
                                                            ?.results[index]
                                                            .name)
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  width: 50.w,
                                                  child: Text(
                                                    (hospitalViewModel
                                                            .hospital
                                                            ?.results[index]
                                                            .vicinity)
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                              ],
                                            ),
                                            IconButton(
                                              onPressed: () => _launchInBrowser(
                                                Uri.parse(
                                                    "https://maps.google.com/?q=${hospitalViewModel.hospital?.results[index].vicinity}"),
                                              ),
                                              icon: Icon(
                                                  Icons.location_on_outlined),
                                              color: Colors.pinkAccent,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ));
            }),
      ),
    );
  }
}
