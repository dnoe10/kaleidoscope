class Animation_Pulse_Horizontal extends Animation_Pulse {
  public Animation_Pulse_Horizontal(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
  }

  public void generateFrames() {
    ArrayList<Strip> strips = new ArrayList<Strip>();
    strips.add(this.zone().getStrip(3));
    strips.add(this.zone().getStrip(9));

    this.generateFullStripFrames(strips);
  }
}
