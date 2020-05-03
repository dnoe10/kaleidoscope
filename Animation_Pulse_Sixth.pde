class Animation_Pulse_Sixth extends Animation_Pulse {
  private int sixth;

  public Animation_Pulse_Sixth(int zoneID, int layerIndex, int sixth) {
    super(zoneID, layerIndex);
    this.sixth = sixth;
  }

  public void generateFrames() {
    Frame frame = this.generateFrame();

    for (Strip strip : this.zone().strips()) {
      strip.mergeFrame(frame);
    }

    this.frameCount++;
    this.completed = this.frameCount == this.getAnimationDuration();
  }

  private Frame generateFrame() {
    Frame frame = new Frame(this.frameSize());
    Pixel pixel;

    if (this.frameCount < UP_DURATION) {
      pixel = new Pixel(this.getColor(), this.brightnessFactor());
    } else {
      pixel = new Pixel(this.getColor(),
          this.brightnessFactor() - (float) (this.frameCount - UP_DURATION)
              / (this.getAnimationDuration() - UP_DURATION) * this.brightnessFactor());
    }

    for (int i = this.frameSize() / 6 * this.sixth; i < this.frameSize() / 6
        * (this.sixth + 1); i++) {
      frame.setPixel(i, pixel);
    }

    return frame;
  }
}
