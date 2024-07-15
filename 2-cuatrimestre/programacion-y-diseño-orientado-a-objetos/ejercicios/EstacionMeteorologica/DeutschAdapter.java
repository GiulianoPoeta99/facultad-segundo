package Punto2;


/**
 * Write a description of class DeutschAdapter here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class DeutschAdapter implements Sensor
{
    // instance variables - replace the example below with your own
    DeutschSensor ds;

    /**
     * Constructor for objects of class DeutschAdapter
     */
    public DeutschAdapter(DeutschSensor ds)
    {
        this.ds=ds;
    }

    public double getTemperatura()
    { return (ds.bekommenTemperatur()-32)*(5./9);
    }
    public double getHumedad()
    { return ds.bekommenFeuchtigkeit();
    }
}