class Initializer {
  public void runInitialization() {
    kaleidoscopeApp.performanceTester().runPerformanceTest();
    kaleidoscopeApp.performanceTester().displayStripOrder(50);
    this.initLaunchpadColors();
    System.out.println("Application ready");
  }

  private void initLaunchpadColors() {
    ColorCatalog colorCatalog = kaleidoscopeApp.colorCatalog();
    MidiController midiController = kaleidoscopeApp.midiController();

    // Turn everything off
    for (int i = 11; i <= 89; i++) {
      if (i % 10 != 0) {
        midiController.sendNoteOff(Launchpad.CHANNEL, i);
      }
    }

    // Init color palette
    for (Map.Entry<Integer, Color> entry : colorCatalog.getCatalog().entrySet()) {
      int pitch = entry.getKey();
      int velocity = entry.getValue().launchpadColorID(); // Color.launchpadColorID
      midiController.sendNoteOn(Launchpad.CHANNEL, pitch, velocity);
    }

    // Turn color picker on
    midiController.sendNoteOn(Launchpad.CHANNEL, 39, (new White()).launchpadColorID());
  }
}
