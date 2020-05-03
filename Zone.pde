abstract class Zone {
  private AnimationStack animationStack;
  private int frameSize;
  private int id;
  private ArrayList<Strip> strips;

  public Zone(PApplet applet, int frameSize, int id, String[] ports) {
    this.animationStack = new AnimationStack();
    this.frameSize = frameSize;
    this.id = id;
    this.strips = new ArrayList<Strip>(ports.length);

    for (int i = 0; i < ports.length; i++) {
      this.strips.add(new Strip(applet, ports[i], frameSize));
    }
  }

  public AnimationStack animationStack() {
    return this.animationStack;
  }

  public int frameSize() {
    return this.frameSize;
  }

  public int id() {
    return this.id;
  }

  public ArrayList<Strip> strips() {
    return this.strips;
  }

  public Strip getStrip(int position) {
    return this.strips.get(position);
  }

  public int numStrips() {
    return this.strips.size();
  }

  public void generateFrames() {
    this.animationStack.generateFrames();
  }
}


class RadialZone extends Zone {
  public static final int FRAME_SIZE = Frame.FRAME_SIZE_60;

  public RadialZone(PApplet applet, int id, String[] ports) {
    super(applet, FRAME_SIZE, id, ports);
  }
}


class SideZone extends Zone {
  public static final int FRAME_SIZE = Frame.FRAME_SIZE_120;

  public SideZone(PApplet applet, int id, String[] ports) {
    super(applet, FRAME_SIZE, id, ports);
  }
}
