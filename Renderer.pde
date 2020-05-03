class Renderer {
  public void renderAllFrames() {
    ArrayList<Strip> strips = kaleidoscopeApp.zoneController().getAllStrips();

    for (int i = 0; i < strips.size(); i++) {
      strips.get(i).setIsRendering(true);
      thread("renderFrame" + i);
    }
    
    this.waitUntilAllFramesRendered();
  }

  private void waitUntilAllFramesRendered() {
    while (!allFramesRendered()) {
      continue;
    }
  }

  private boolean allFramesRendered() {
    for (Strip strip : kaleidoscopeApp.zoneController().getAllStrips()) {
      if (strip.isRendering()) {
        return false;
      }
    }
    
    return true;
  }
}
