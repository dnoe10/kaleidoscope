class Animation_Train_Outward extends Animation {
  public Animation_Train_Outward(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
  }

  public void generateFrames() {
    Frame frame = this.generateFrame();

    for (Strip strip : this.zone().strips()) {
      strip.mergeFrame(frame);
    }

    this.advanceAnimation();
  }

  private Frame generateFrame() {
    Frame frame = new Frame(this.frameSize());
    Pixel pixel = new Pixel(this.getColor(), this.brightnessFactor());

    if (this.frameCount <= this.frameSize()) {
      for (int i = 0; i < this.frameCount; i++) {
        frame.setPixel(i, pixel);
      }
    } else {
      for (int i = this.frameCount - this.frameSize(); i < this.frameSize(); i++) {
        frame.setPixel(i, pixel);
      }
    }

    return frame;
  }

  private void advanceAnimation() {
    if (this.frameCount == this.frameSize() * 2 - 1) {
      this.frameCount = 0;
      this.rainbowColorTick();
    } else {
      this.frameCount++;
    }
  }
}
