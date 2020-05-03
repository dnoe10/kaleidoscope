class Animation_Dot_Inward extends Animation {
  private int position;

  public Animation_Dot_Inward(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
    this.position = this.frameSize() - 1;
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

    frame.setPixel(this.position, pixel);
    
    return frame;
  }

  private void advanceAnimation() {
    if (this.position == 0) {
      this.position = this.frameSize() - 1;
      this.rainbowColorTick();
    } else {
      this.position--;
    }
  }
}
