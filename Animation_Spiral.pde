class Animation_Spiral extends Animation {
  private static final int SPEED_MODIFIER = 2;

  private int spiralOrigin;

  public Animation_Spiral(int zoneID, int layerIndex) {
    super(zoneID, layerIndex);
    this.spiralOrigin = 0;  
  }

  public void generateFrames() {
    ArrayList<Frame> frames = this.drawSpiral();
    
    for (int i = 0; i < this.numFrames(); i++) {
      this.zone().getStrip(i).mergeFrame(frames.get(i));
    }

    this.advanceAnimation();
  }

  private ArrayList<Frame> drawSpiral() {
    ArrayList<Frame> frames = new ArrayList<Frame>(this.numFrames());

    for (int i = 0; i < this.numFrames(); i++) {
      frames.add(new Frame(this.frameSize()));
    }

    int frameIndex = this.spiralOrigin;
    int pixelIndex = 0;

    while (pixelIndex < this.frameSize()) {
      Frame frame = frames.get(frameIndex);
      frame.setPixel(pixelIndex, new Pixel(this.getColor(), this.brightnessFactor()));
      frameIndex = frameIndex == this.numFrames() - 1 ? 0 : frameIndex + 1;
      pixelIndex++;
    }

    return frames;
  }

  private void advanceAnimation() {
    if (this.frameCount >= SPEED_MODIFIER) {
      this.spiralOrigin = this.spiralOrigin == 0 ? this.numFrames() - 1 : this.spiralOrigin - 1;
      this.frameCount = 0;
    } else {
      this.frameCount++;
    }
  }
}
