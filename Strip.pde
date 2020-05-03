class Strip {
  private Frame frame;
  private boolean isRendering;
  private String port;
  private BlinkyTape tape;

  Strip(PApplet applet, String port, int frameSize) {
    this.frame = new Frame(frameSize);
    this.isRendering = false;
    this.port = port;
    this.tape = new BlinkyTape(applet, port, frameSize);
  }

  public Frame frame() {
    return this.frame;
  }

  public boolean isRendering() {
    return this.isRendering;
  }

  public String port() {
    return this.port;
  }

  /**
   * Sets the strip's frame to the given frame. WARNING: This method should not be called by
   * Animations. Otherwise, it may overwrite other animations that have already been written to the
   * strip. Animations should generally use mergeFrame() instead.
   */
  public void setFrame(Frame frame) {
    this.frame = frame;
  }

  public void setIsRendering(boolean isRendering) {
    this.isRendering = isRendering;
  }

  public void clearFrame() {
    this.frame.clear();
  }

  /**
   * This method overlays the non-black pixels in the given frame onto the strip's frame.
   */
  public void mergeFrame(Frame frame) {
    if (frame.numPixels() != this.frame.numPixels()) {
      throw new RuntimeException("Attempted to merge frames of different sizes.");
    }

    for (int i = 0; i < frame.numPixels(); i++) {
      Pixel pixel = frame.getPixel(i);
      if (!pixel.isBlack()) {
        this.frame.setPixel(i, pixel);
      }
    }
  }

  /**
   * WARNING: Do not call this function from the main thread or it will be blocked until the serial
   * I/O is complete. All rendering calls should go through the Renderer class.
   */
  public void __renderFrame() {
    for (Pixel pixel : this.frame.pixels()) {
      this.tape.pushPixel(pixel);
    }
    this.tape.update();
    this.setIsRendering(false);
  }
}
