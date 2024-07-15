// Subsistema - Clase que representa un amplificador
class Amplifier {
    public void on() {
        System.out.println("Encendiendo el amplificador");
    }

    public void setVolume(int level) {
        System.out.println("Ajustando el volumen del amplificador a " + level);
    }

    public void off() {
        System.out.println("Apagando el amplificador");
    }
}

// Subsistema - Clase que representa un reproductor de DVD
class DvdPlayer {
    public void on() {
        System.out.println("Encendiendo el reproductor de DVD");
    }

    public void play(String movie) {
        System.out.println("Reproduciendo la película: " + movie);
    }

    public void off() {
        System.out.println("Apagando el reproductor de DVD");
    }
}

// Subsistema - Clase que representa un proyector
class Projector {
    public void on() {
        System.out.println("Encendiendo el proyector");
    }

    public void setInput(DvdPlayer dvdPlayer) {
        System.out.println("Estableciendo la entrada del proyector desde el reproductor de DVD");
    }

    public void off() {
        System.out.println("Apagando el proyector");
    }
}

// Facade - Clase que proporciona una interfaz unificada para el subsistema de audio
class HomeTheaterFacade {
    private Amplifier amplifier;
    private DvdPlayer dvdPlayer;
    private Projector projector;

    public HomeTheaterFacade(Amplifier amplifier, DvdPlayer dvdPlayer, Projector projector) {
        this.amplifier = amplifier;
        this.dvdPlayer = dvdPlayer;
        this.projector = projector;
    }

    public void watchMovie(String movie, int volume) {
        System.out.println("Preparándose para ver una película...");
        amplifier.on();
        amplifier.setVolume(volume);
        dvdPlayer.on();
        dvdPlayer.play(movie);
        projector.on();
        projector.setInput(dvdPlayer);
    }

    public void endMovie() {
        System.out.println("Finalizando la película...");
        amplifier.off();
        dvdPlayer.off();
        projector.off();
    }
}

// Cliente que utiliza el patrón Facade
class FacadeClient {
    public static void main(String[] args) {
        // Crear instancias de subsistemas
        Amplifier amplifier = new Amplifier();
        DvdPlayer dvdPlayer = new DvdPlayer();
        Projector projector = new Projector();

        // Crear la fachada y proporcionar una interfaz unificada
        HomeTheaterFacade homeTheater = new HomeTheaterFacade(amplifier, dvdPlayer, projector);

        // Utilizar la fachada para ver una película
        homeTheater.watchMovie("Inception", 20);

        // Utilizar la fachada para finalizar la película
        homeTheater.endMovie();
    }
}
