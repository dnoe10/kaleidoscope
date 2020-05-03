class Animation_Dot_Outward extends Animation {
  private int position;

  public Animation_Dot_Outward(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
    this.position = 0;
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
    if (this.position == this.frameSize() - 1) {
      this.position = 0;
      this.rainbowColorTick();
    } else {
      this.position++;
    }
  }
}
