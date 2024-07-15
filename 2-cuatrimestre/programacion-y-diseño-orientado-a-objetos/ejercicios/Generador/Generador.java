import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Random;

//import java.awt.BorderLayout;

public class Generador extends JFrame{
    
    private RadioGenerador[] generadores;
    private JButton btGenerar;
    private JLabel jlNumero;
    
    public Generador() {
        
        iniciarComponentes();
        
        setLayout(new BorderLayout());
        JPanel pnNorte = new JPanel();
        pnNorte.add(new JLabel("Generador Números"));
        
        JPanel pnCentro = new JPanel();
        JPanel pnRadio = new JPanel();
        pnRadio.setLayout(new BoxLayout(pnRadio, BoxLayout.Y_AXIS));
        pnRadio.add(generadores[0]);
        pnRadio.add(generadores[1]);
        pnRadio.add(generadores[2]);
        pnRadio.setBorder(BorderFactory.createEmptyBorder(20, 40, 20, 80));
        JPanel pnBoton = new JPanel();
        pnBoton.add(btGenerar);
        pnCentro.setLayout(new BoxLayout(pnCentro, BoxLayout.Y_AXIS));
        pnCentro.add(pnRadio);
        pnCentro.add(pnBoton);
        
        JPanel pnSur = new JPanel();
        pnSur.setBorder(BorderFactory.createEmptyBorder(25, 25, 25, 25));
        pnSur.add(jlNumero);
        
        add(pnNorte, BorderLayout.NORTH);
        add(pnCentro, BorderLayout.CENTER);
        add(pnSur, BorderLayout.SOUTH);
        
        setTitle("Generador Random");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }
    
    private void iniciarComponentes() {
        generadores = new RadioGenerador[3];
        generadores[0] = new RadioGenerador(0,100, "Entre 0 y 100");
        generadores[1] = new RadioGenerador(100,200, "Entre 100 y 200");
        generadores[2] = new RadioGenerador(200,500, "Entre 200 y 500");
        ButtonGroup grupo = new ButtonGroup();
        grupo.add(generadores[0]);
        grupo.add(generadores[1]);
        grupo.add(generadores[2]);
        btGenerar = new JButton("GENERAR");
        btGenerar.addActionListener(new AccionGenerar());
        jlNumero = new JLabel(String.format("%03d", 0));
        jlNumero.setFont(new Font("Verdana", Font.BOLD, 34));
        jlNumero.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(Color.BLACK, 5),
                BorderFactory.createEmptyBorder(10, 10, 10, 10)));
    }
    
    
    private class RadioGenerador extends JRadioButton {
        private int minimo;
        private int maximo;
        
        public RadioGenerador(int min, int max, String texto) {
            minimo = min;
            maximo = max;
            setText(texto);
            setFocusPainted(false);
        }
        
        public int generaRandom() {
            Random rnd = new Random();
            return minimo + rnd.nextInt(maximo-minimo);
        }
    }
    
    private class AccionGenerar implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            int numAzar = 0;
            //Buscamos en el array que Generador está seleccionado 
            // y le pedimos un random
            for (RadioGenerador generador: generadores)
                if (generador.isSelected())
                    numAzar = generador.generaRandom();
            //Lo pasamos al JLabel
            jlNumero.setText(String.format("%03d", numAzar));
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new Generador();    
            }
        });
    }
}