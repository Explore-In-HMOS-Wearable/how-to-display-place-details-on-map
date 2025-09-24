import { site, mapCommon } from '@kit.MapKit';

// Class representing a place with location details
export class Place {
  // Unique identifier of the site
  siteId: string = '';
  // Name of the place
  name: string = '';
  // Address of the place
  address: string = '';
  // Geographic location (latitude & longitude)
  location: mapCommon.LatLng = { latitude: 0, longitude: 0 };

  // Constructor initializes Place object from a Site object if provided
  constructor(site?: site.Site) {
    if (site) {
      // Assign siteId from the Site object
      this.siteId = site.siteId;
      // Assign name, default to empty string if not available
      this.name = site.name ?? '';
      // Assign formatted address, default to empty string if not available
      this.address = site.formatAddress ?? '';
      // Assign geographic location (LatLng must exist in Site)
      this.location = site.location!;
    }
  }
}