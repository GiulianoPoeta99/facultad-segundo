// Interfaz State que declara los métodos para cada estado del reproductor
interface State {
    void pressPlay(PlayerContext context);
    void pressPause(PlayerContext context);
    void pressStop(PlayerContext context);
}

// Clase concreta que implementa la interfaz State para el estado de reproducción
class PlayingState implements State {
    @Override
    public void pressPlay(PlayerContext context) {
        System.out.println("Ya estamos reproduciendo.");
    }

    @Override
    public void pressPause(PlayerContext context) {
        System.out.println("Pausando la reproducción.");
        context.setState(new PausedState());
    }

    @Override
    public void pressStop(PlayerContext context) {
        System.out.println("Deteniendo la reproducción.");
        context.setState(new StoppedState());
    }
}

// Clase concreta que implementa la interfaz State para el estado de pausa
class PausedState implements State {
    @Override
    public void pressPlay(PlayerContext context) {
        System.out.println("Reanudando la reproducción.");
        context.setState(new PlayingState());
    }

    @Override
    public void pressPause(PlayerContext context) {
        System.out.println("Ya estamos en pausa.");
    }

    @Override
    public void pressStop(PlayerContext context) {
        System.out.println("Deteniendo la reproducción.");
        context.setState(new StoppedState());
    }
}

// Clase concreta que implementa la interfaz State para el estado detenido
class StoppedState implements State {
    @Override
    public void pressPlay(PlayerContext context) {
        System.out.println("Iniciando la reproducción.");
        context.setState(new PlayingState());
    }

    @Override
    public void pressPause(PlayerContext context) {
        System.out.println("Ya estamos detenidos.");
    }

    @Override
    public void pressStop(PlayerContext context) {
        System.out.println("Ya estamos detenidos.");
    }
}

// Clase que representa el contexto (Reproductor)
class PlayerContext {
    private State state;

    public PlayerContext() {
        // Inicializar el estado a detenido
        this.state = new StoppedState();
    }

    public void setState(State state) {
        this.state = state;
    }

    public void pressPlay() {
        state.pressPlay(this);
    }

    public void pressPause() {
        state.pressPause(this);
    }

    public void pressStop() {
        state.pressStop(this);
    }
}

// Cliente que utiliza el patrón State
class StateExample {
    public static void main(String[] args) {
        // Crear instancia del reproductor
        PlayerContext player = new PlayerContext();

        // Interactuar con el reproductor en diferentes estados
        player.pressPlay(); // Iniciando la reproducción.
        player.pressPause(); // Pausando la reproducción.
        player.pressPlay(); // Reanudando la reproducción.
        player.pressStop(); // Deteniendo la reproducción.
    }
}
