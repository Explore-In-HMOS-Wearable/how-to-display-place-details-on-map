import { mapCommon, MapComponent } from '@kit.MapKit';

@Entry
@Component
struct Index {
  @State mapOptions?: mapCommon.MapOptions | null = null;
  @State markerOptions?: mapCommon.MarkerOptions | null = null;

  aboutToAppear() {
    const defaultLocation: mapCommon.LatLng = {
      latitude: 38.447967,
      longitude: 27.179380
    };
    this.mapOptions = {
      position: {
        target: defaultLocation,
        zoom: 17
      },
    };

    this.markerOptions = {
      position: defaultLocation,
      icon: $r('app.media.vector'),
      title: this.getUIContext().getHostContext()?.resourceManager.getStringByNameSync('marker_title_huawei_izmir'),
      clickable: true,
      alpha: 1,
      anchorU: 0.5,
      anchorV: 0.5
    };
  }

  build() {
    Column() {
      if (this.mapOptions) {
        MapComponent({
          mapOptions: this.mapOptions,
          mapCallback: async (err, ctrl) => {
            if (!err) {
              if (this.markerOptions) {
                await ctrl?.addMarker(this.markerOptions);
              }
            }
          }
        })
          .width('105%')
          .height($r('app.float.map_size'))
      } else {
        Text($r('app.string.loading_map_text'))
          .width('100%')
          .textAlign(TextAlign.Center)
      }
    }
    .padding($r('app.float.padding_medium'))
  }
}