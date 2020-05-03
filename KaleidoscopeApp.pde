class KaleidoscopeApp {
  private AnimationCatalog animationCatalog;
  private ColorCatalog colorCatalog;
  private Initializer initializer;
  private MidiController midiController;
  private PerformanceTester performanceTester;
  private Renderer renderer;
  private StateManager stateManager;
  private ZoneController zoneController;

  public KaleidoscopeApp(PApplet applet) {
    // AnimationCatalog cannot be initialized yet. See startApplication() below.
    this.colorCatalog = new ColorCatalog();
    this.initializer = new Initializer();
    this.midiController = new MidiController(applet);
    this.performanceTester = new PerformanceTester();
    this.renderer = new Renderer();
    this.stateManager = new StateManager();
    this.zoneController = new ZoneController(applet);
  }

  public AnimationCatalog animationCatalog() {
    if (this.animationCatalog == null) {
      throw new RuntimeException("Attempted to get AnimationCatalog before it is initalized. ");
    }

    return this.animationCatalog;
  }

  public ColorCatalog colorCatalog() {
    return this.colorCatalog;
  }

  public Initializer initializer() {
    return this.initializer;
  }

  public MidiController midiController() {
    return this.midiController;
  }

  public PerformanceTester performanceTester() {
    return this.performanceTester;
  }

  public Renderer renderer() {
    return this.renderer;
  }

  public StateManager stateManager() {
    return this.stateManager;
  }

  public ZoneController zoneController() {
    return this.zoneController;
  }

  public void startApplication() {
    // The AnimationCatalog must be built after the KaleidoscopeApp object is initialized because
    // certain Animations depend on this object during their construction.
    this.animationCatalog = new AnimationCatalog();
    this.initializer.runInitialization();
  }

  public void draw() {
    this.checkForInterrupts();
    this.zoneController.generateFrames();
    this.renderer.renderAllFrames();
  }

  private void checkForInterrupts() {
    if (keyPressed && key == BACKSPACE) {
      this.performanceTester.displayStripOrder(1000);
    }
  }
}
