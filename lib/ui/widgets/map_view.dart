import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatelessWidget {
  final double lat;
  final double long;
  final List<LatLng> latlngs;
  final BitmapDescriptor? markerbitmap;
  final BitmapDescriptor? nearbyMarkerbitmap;
  final LatLng cameraTarget;
  final double zoom;
  final LatLng? latLng;
  final List<Marker>? markers;
  final Function(GoogleMapController) onMapCreated;

  const GoogleMapPage({
    Key? key,
    required this.lat,
    required this.long,
    required this.latlngs,
    this.markerbitmap,
    this.nearbyMarkerbitmap,
    required this.cameraTarget,
    required this.onMapCreated,
    this.markers, //= const [],
    this.latLng,
    this.zoom = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      key: key,
      mapType: MapType.normal,
      markers: Set.from(markers ??
          [
            Marker(
              markerId: const MarkerId('map'),
              draggable: true,
              position: LatLng(
                lat,
                long,
              ),
              icon: BitmapDescriptor.defaultMarker,
            ),
          ]),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: onMapCreated,
      compassEnabled: false,
      initialCameraPosition: CameraPosition(
        target: cameraTarget,
        zoom: zoom,
      ),
    );
  }
}
