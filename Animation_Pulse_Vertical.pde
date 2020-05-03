class Animation_Pulse_Vertical extends Animation_Pulse {
  public Animation_Pulse_Vertical(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
  }

  public void generateFrames() {
    ArrayList<Strip> strips = new ArrayList<Strip>();
    strips.add(this.zone().getStrip(0));
    strips.add(this.zone().getStrip(6));

    this.generateFullStripFrames(strips);
  }
}
