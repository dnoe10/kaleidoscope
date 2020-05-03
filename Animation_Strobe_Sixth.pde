class Animation_Strobe_Sixth extends Animation_Strobe {
  private int sixth;

  public Animation_Strobe_Sixth(int zoneID, int layerIndex, int sixth) {
    super(zoneID, layerIndex);
    this.sixth = sixth;
  }

  public void generateFrames() {
    if (this.frameCount >= 0 && this.frameCount <= 1) {
      Frame frame = this.generateFrame();

      for (Strip strip : this.zone().strips()) {
        strip.mergeFrame(frame);
      }
    }

    this.frameCount = this.frameCount == this.getAnimationDuration() ? 0 : this.frameCount + 1;
  }

  private Frame generateFrame()
  {
    Frame frame = new Frame(this.frameSize());
    Pixel pixel = new Pixel(this.getColor(), this.brightnessFactor());

    for (int i = this.frameSize() / 6 * this.sixth; i < this.frameSize() / 6
        * (this.sixth + 1); i++) {
      frame.setPixel(i, pixel);
    }

    return frame;
  }
}
