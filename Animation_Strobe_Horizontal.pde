class Animation_Strobe_Horizontal extends Animation_Strobe {
  public Animation_Strobe_Horizontal(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
  }

  public void generateFrames() {
    ArrayList<Strip> strips = new ArrayList<Strip>();
    strips.add(this.zone().getStrip(3));
    strips.add(this.zone().getStrip(9));

    this.generateFullStripFrames(strips);
  }
}
