class Animation_Turbine extends Animation {
  private static final int NUM_TURBINE_BLADES = 3;

  private int turbineOrigin;

  public Animation_Turbine(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
    this.turbineOrigin = 0;  
  }

  public void generateFrames() {
    Frame frame = new Frame(this.frameSize(), this.getColor(), this.brightnessFactor());
    int stripIndex = this.turbineOrigin;
    int bladeSpacing = this.numFrames() / NUM_TURBINE_BLADES;
    int numFramesGenerated = 0;

    while (numFramesGenerated < NUM_TURBINE_BLADES) {
      this.zone().getStrip(stripIndex).mergeFrame(frame);
      stripIndex += bladeSpacing;
      stripIndex = stripIndex >= this.numFrames() ? stripIndex - this.numFrames() : stripIndex;
      numFramesGenerated++;
    }

    this.advanceAnimation();
  }

  private void advanceAnimation() {
    if (this.frameCount >= this.genericSpeedModifier()) {
      this.turbineOrigin = this.turbineOrigin == this.numFrames() - 1 ? 0 : this.turbineOrigin + 1;
      this.rainbowColorTick();
      this.frameCount = 0;
    } else {
      this.frameCount++;
    }
  }
}
