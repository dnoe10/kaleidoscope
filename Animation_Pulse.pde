abstract class Animation_Pulse extends Animation {
  public static final int DEFAULT_ANIMATION_DURATION = 50;

  protected static final int UP_DURATION = 10;

  public Animation_Pulse(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
  }

  protected int getAnimationDuration() {
    return kaleidoscopeApp.stateManager().getPulseAnimationDuration();
  }

  protected void generateFullStripFrames(ArrayList<Strip> strips) {
    Frame frame = this.generateFullFrame();
    
    for (Strip strip : strips) {
      strip.mergeFrame(frame);
    }

    this.frameCount++;
    this.completed = this.frameCount >= this.getAnimationDuration();
  }

  protected Frame generateFullFrame() {
    Frame frame = new Frame(this.frameSize());

    if (this.frameCount < UP_DURATION) {
      frame = new Frame(this.frameSize(), this.getColor(), this.brightnessFactor());
    } else {
      frame = new Frame(this.frameSize(), this.getColor(),
          this.brightnessFactor() - (float) (this.frameCount - UP_DURATION)
              / (this.getAnimationDuration() - UP_DURATION) * this.brightnessFactor());
    }

    return frame;
  }
}
