package Punto2;

import java.util.*;

public class EstacionMeteorologica
{
    // instance variables - replace the example below with your own
    private List<Sensor> sensores;

    /**
     * Constructor for objects of class EstacionMeteorologica
     */
    public EstacionMeteorologica()
    {
        // initialise instance variables
        sensores=new ArrayList<Sensor>();
        
    }

    public void addSensor(Sensor sensor)
    { 
        sensores.add(sensor);
    }
    
    public void verSensores()
    {
       for (Sensor s:sensores)
       { System.out.println("temperatura: "+s.getTemperatura()+" °C humedad: "+s.getHumedad());
        }
}
}
