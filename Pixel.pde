class Pixel {
  public static final int MAX_RGB_VALUE = 254; // 255 is reserved by BlinkyTape
  public static final double MAX_BRIGHTNESS_FACTOR = 1.0;

  private int r;
  private int g;
  private int b;

  public Pixel() {
    this(new Black(), 0.0);
  }

  public Pixel(Color c) {
    this(c, MAX_BRIGHTNESS_FACTOR);
  }

  public Pixel(Color c, double brightnessFactor) {
    this.r =
        Math.min((int) (c.r() * Math.min(brightnessFactor, MAX_BRIGHTNESS_FACTOR)), MAX_RGB_VALUE);
    this.g =
        Math.min((int) (c.g() * Math.min(brightnessFactor, MAX_BRIGHTNESS_FACTOR)), MAX_RGB_VALUE);
    this.b =
        Math.min((int) (c.b() * Math.min(brightnessFactor, MAX_BRIGHTNESS_FACTOR)), MAX_RGB_VALUE);
  }

  public int r() {
    return this.r;
  }

  public int g() {
    return this.g;
  }

  public int b() {
    return this.b;
  }

  public String toString() {
    return "{R: " + this.r + "; G: " + this.g + "; B: " + this.b + "}";
  }

  public boolean isBlack() {
    return this.r == 0 && this.g == 0 && this.b == 0;
  }
}
