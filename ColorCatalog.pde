class ColorCatalog {
  private HashMap<Integer, Color> catalog;
  private CustomColor customColor;
  private RainbowColor rainbowColor;

  public ColorCatalog() {
    this.customColor = new CustomColor();
    this.rainbowColor = new RainbowColor();
    this.catalog = this.buildCatalog();
  }

  public HashMap<Integer, Color> getCatalog() {
    return this.catalog;
  }

  public Color getColor(int id) {
    return this.catalog.get(id);
  }

  public CustomColor getCustomColor() {
    return this.customColor;
  }

  public RainbowColor getRainbowColor() {
    return this.rainbowColor;
  }

  private HashMap<Integer, Color> buildCatalog() {
    HashMap<Integer, Color> catalog = new HashMap<Integer, Color>();

    // This map associates Colors with their locations on the Launchpad. Since there is a 1-to-1
    // mapping between Colors and Launchpad cells, these values can also be used to uniquely
    // identify Colors throughout the application.
    catalog.put(11, new Red());
    catalog.put(12, new Orange());
    catalog.put(13, new Yellow());
    catalog.put(14, new Green());
    catalog.put(15, new Teal());
    catalog.put(16, new Cyan());
    catalog.put(17, new Blue());
    catalog.put(18, new Purple());
    catalog.put(21, new LightBlue());
    catalog.put(22, new Magenta());
    catalog.put(23, new White());
    catalog.put(24, this.customColor);
    catalog.put(25, this.rainbowColor);

    return catalog;
  }
}
