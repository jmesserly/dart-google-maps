#import('dart:html');
#import('package:dart_google_maps/gmaps.dart', prefix:'gmaps');
#import('package:dart_google_maps/jsni.dart', prefix:'js');

void initialize() {
  final mapOptions = new gmaps.MapOptions()
    ..zoom = 8
    ..center = new gmaps.LatLng(-34.397, 150.644)
    ..mapTypeId = gmaps.MapTypeId.ROADMAP
    ;
  final map = new gmaps.GMap(query("#map_canvas"), mapOptions);
}

void main() {
  js.jsWindow.$["initialize"] = (List) { initialize(); };

  final script = new ScriptElement()
    ..type = 'text/javascript'
    ..src = 'https://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize'
    ;
  document.body.elements.add(script);
}