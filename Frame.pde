class Frame {
  public static final int FRAME_SIZE_60 = 60;
  public static final int FRAME_SIZE_120 = 120;

  private int numPixels;
  private ArrayList<Pixel> pixels;

  public Frame(int numPixels) {
    this.numPixels = numPixels;
    this.pixels = this.getEmptyFrame();
  }

  public Frame(int numPixels, Color c) {
    this(numPixels, c, Pixel.MAX_BRIGHTNESS_FACTOR);
  }

  public Frame(int numPixels, Color c, double brightnessFactor) {
    this.numPixels = numPixels;
    this.pixels =
        new ArrayList<Pixel>(Collections.nCopies(this.numPixels, new Pixel(c, brightnessFactor)));
  }

  public int numPixels() {
    return this.numPixels;
  }

  public ArrayList<Pixel> pixels() {
    return this.pixels;
  }

  public Pixel getPixel(int index) {
    return this.pixels.get(index);
  }

  public void setPixel(int index, Pixel pixel) {
    this.pixels.set(index, pixel);
  }

  public void clear() {
    this.pixels = this.getEmptyFrame();
  }

  public String toString() {
    StringBuilder frameData = new StringBuilder();
    for (int i = 0; i < this.numPixels; i++) {
      frameData.append(i + ": " + this.getPixel(i).toString() + "\n");
    }
    return frameData.toString();
  }

  private ArrayList<Pixel> getEmptyFrame() {
    return this.pixels = new ArrayList<Pixel>(Collections.nCopies(this.numPixels, new Pixel()));
  }
}
