abstract class MidiHardware {
  private MidiBus midiBus;
  private int channel;

  abstract void receiveNoteOn(int pitch, int velocity);

  abstract void receiveNoteOff(int pitch, int velocity);

  abstract void receiveControllerChange(int number, int value);

  public MidiHardware(PApplet applet, int inDeviceNum, int outDeviceNum, int channel) {
    this.midiBus = new MidiBus(applet, inDeviceNum, outDeviceNum);
    this.channel = channel;
  }

  public int channel() {
    return this.channel;
  }

  public void sendNoteOn(int pitch, int velocity) {
    this.midiBus.sendNoteOn(this.channel, pitch, velocity);
  }

  public void sendNoteOff(int pitch) {
    this.midiBus.sendNoteOff(this.channel, pitch, 0);
  }

  public void sendControllerChange(int number, int value) {
    this.midiBus.sendControllerChange(this.channel, number, value);
  }
}
