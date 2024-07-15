package Punto2;


/**
 * Write a description of class Prueba here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Prueba
{
    public static void main(String []args)
    {
        EstacionMeteorologica em=new EstacionMeteorologica();
        em.addSensor(new SensorXX1());
        em.addSensor(new SensorXX2());
        em.addSensor(new DeutschAdapter(new DeutschSensor()));
        em.verSensores();
        
    }
}
