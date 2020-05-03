class Animation_Step_Inward extends Animation {
  private static final int NUM_STEPS = 4;
  private static final int SPEED_MODIFIER = 10;

  private int startingPosition;

  public Animation_Step_Inward(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
    this.startingPosition = this.frameSize() - (this.frameSize() / NUM_STEPS);
  }

  public void generateFrames() {
    Frame frame = this.generateFrame();

    for (int i = 0; i < this.numFrames(); i++) {
      this.zone().getStrip(i).mergeFrame(frame);
    }

    if (this.frameCount >= this.genericSpeedModifier()) {
      this.frameCount = 0;
      this.startingPosition -= this.frameSize() / NUM_STEPS;
      this.startingPosition =
          this.startingPosition < 0 ? this.frameSize() - (this.frameSize() / NUM_STEPS)
              : this.startingPosition;
      this.rainbowColorTick();
    } else {
      this.frameCount++;
    }
  }

  private Frame generateFrame() {
    Frame frame = new Frame(this.frameSize());
    Pixel pixel = new Pixel(this.getColor(), this.brightnessFactor());

    for (int i = this.startingPosition; i < this.startingPosition
        + (this.frameSize() / NUM_STEPS); i++) {
      frame.setPixel(i, pixel);
    }

    return frame;
  }
}
