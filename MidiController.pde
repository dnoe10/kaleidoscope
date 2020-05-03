class MidiController {
  // Map of MIDI channel to MidiHardware object
  private HashMap<Integer, MidiHardware> midiHardware;

  public MidiController(PApplet applet) {
    MidiBus.list();
    this.buildMidiHardwareHashMap(applet);
  }

  private void buildMidiHardwareHashMap(PApplet applet) {
    this.midiHardware = new HashMap<Integer, MidiHardware>();

    Launchpad launchpad = new Launchpad(applet);
    LaunchControl launchControl = new LaunchControl(applet);
    
    this.midiHardware.put(launchpad.channel(), launchpad);
    this.midiHardware.put(launchControl.channel(), launchControl);
  }

  public void receiveNoteOn(int channel, int pitch, int velocity) {
    this.midiHardware.get(channel).receiveNoteOn(pitch, velocity);
  }

  public void receiveNoteOff(int channel, int pitch, int velocity) {
    this.midiHardware.get(channel).receiveNoteOff(pitch, velocity);
  }

  public void receiveControllerChange(int channel, int number, int value) {
    this.midiHardware.get(channel).receiveControllerChange(number, value);
  }

  public void sendNoteOn(int channel, int pitch, int velocity) {
    this.midiHardware.get(channel).sendNoteOn(pitch, velocity);
  }

  public void sendNoteOff(int channel, int pitch) {
    this.midiHardware.get(channel).sendNoteOff(pitch);
  }

  public void sendControllerChange(int channel, int number, int value) {
    this.midiHardware.get(channel).sendControllerChange(number, value);
  }
}
