// Interfaz Command que declara el método execute
interface Command {
    void execute();
}

// Clase concreta que implementa la interfaz Command para encender un dispositivo
class LightOnCommand implements Command {
    private Light light;

    public LightOnCommand(Light light) {
        this.light = light;
    }

    @Override
    public void execute() {
        light.turnOn();
    }
}

// Clase concreta que implementa la interfaz Command para apagar un dispositivo
class LightOffCommand implements Command {
    private Light light;

    public LightOffCommand(Light light) {
        this.light = light;
    }

    @Override
    public void execute() {
        light.turnOff();
    }
}

// Clase concreta que implementa la interfaz Command para ajustar el volumen de un dispositivo
class StereoVolumeUpCommand implements Command {
    private Stereo stereo;

    public StereoVolumeUpCommand(Stereo stereo) {
        this.stereo = stereo;
    }

    @Override
    public void execute() {
        stereo.volumeUp();
    }
}

// Clase que representa el receptor (dispositivo)
class Light {
    public void turnOn() {
        System.out.println("La luz está encendida.");
    }

    public void turnOff() {
        System.out.println("La luz está apagada.");
    }
}

// Clase que representa otro receptor (dispositivo)
class Stereo {
    public void volumeUp() {
        System.out.println("Volumen aumentado.");
    }
}

// Clase invocadora que ejecuta comandos
class RemoteControl {
    private Command command;

    public void setCommand(Command command) {
        this.command = command;
    }

    public void pressButton() {
        command.execute();
    }
}

// Cliente que utiliza el patrón Command
class CommandClient {
    public static void main(String[] args) {
        // Crear instancias de dispositivos y comandos
        Light light = new Light();
        Stereo stereo = new Stereo();

        Command lightOnCommand = new LightOnCommand(light);
        Command lightOffCommand = new LightOffCommand(light);
        Command volumeUpCommand = new StereoVolumeUpCommand(stereo);

        // Crear instancias de control remoto
        RemoteControl remoteControl1 = new RemoteControl();
        RemoteControl remoteControl2 = new RemoteControl();

        // Configurar los comandos en los controles remotos
        remoteControl1.setCommand(lightOnCommand);
        remoteControl2.setCommand(volumeUpCommand);

        // Presionar los botones en los controles remotos
        remoteControl1.pressButton(); // Enciende la luz
        remoteControl2.pressButton(); // Aumenta el volumen del estéreo
    }
}
