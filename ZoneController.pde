class ZoneController {
  public static final int RADIAL_ZONE = 0;
  public static final int SIDE_ZONE = 1;

  private Zone radialZone;
  private Zone sideZone;

  private String[] radialZonePorts = {"COM12", "COM7", "COM6", "COM13", "COM8", "COM9", "COM5",
      "COM11", "COM3", "COM14", "COM4", "COM10",};

  private String[] sideZonePorts = {};

  public ZoneController(PApplet applet) {
    this.radialZone = new RadialZone(applet, RADIAL_ZONE, this.radialZonePorts);
    this.sideZone = new SideZone(applet, SIDE_ZONE, this.sideZonePorts);
  }

  public Zone radialZone() {
    return this.radialZone;
  }

  public Zone sideZone() {
    return this.sideZone;
  }

  public Zone getZone(int zoneID) {
    switch (zoneID) {
      case RADIAL_ZONE:
        return this.radialZone;
      case SIDE_ZONE:
        return this.sideZone;
      default:
        throw new IllegalArgumentException("Invalid zone ID passed to ZoneController.getZone()");
    }
  }

  public ArrayList<Strip> getAllStrips() {
    ArrayList<Strip> strips = new ArrayList<Strip>();

    strips.addAll(this.radialZone.strips());
    strips.addAll(this.sideZone.strips());

    return strips;
  }

  public void generateFrames() {
    this.clearAllStrips();
    this.radialZone.generateFrames();
    // this.sideZone.generateFrames();
  }

  public void clearAllStrips() {
    for (Strip strip : this.getAllStrips()) {
      strip.frame().clear();
    }
  }
}
