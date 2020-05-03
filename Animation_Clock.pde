class Animation_Clock extends Animation {
  private int stripIndex;

  public Animation_Clock(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
    this.stripIndex = 0;
  }

  public void generateFrames() {
    Frame frame = new Frame(this.frameSize(), this.getColor(), this.brightnessFactor());
    this.zone().getStrip(this.stripIndex).mergeFrame(frame);
    this.advanceAnimation();
  }

  private void advanceAnimation() {
    if (this.frameCount >= this.genericSpeedModifier()) {
      this.stripIndex = this.stripIndex == this.numFrames() - 1 ? 0 : this.stripIndex + 1;
      this.rainbowColorTick();
      this.frameCount = 0;
    } else {
      this.frameCount++;
    }
  }
}
