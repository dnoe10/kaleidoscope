abstract class Animation_Strobe extends Animation {
  public static final int DEFAULT_ANIMATION_DURATION = 7;

  public Animation_Strobe(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
  }

  protected int getAnimationDuration() {
    return kaleidoscopeApp.stateManager().getStrobeAnimationDuration();
  }

  protected void generateFullStripFrames(ArrayList<Strip> strips) {
    if (this.frameCount >= 0 && this.frameCount <= 1) {
      Frame frame = new Frame(this.frameSize(), this.getColor(), this.brightnessFactor());

      for (Strip strip : strips) {
        strip.mergeFrame(frame);
      }
    }

    this.frameCount = this.frameCount >= this.getAnimationDuration() ? 0 : this.frameCount + 1;
  }
}