

public class Robot implements Comparable<Robot>
{
    
    private static int proxNro=1;
    private int nroRobot;
    private int vida;
    private static final int LIMINF=1;
    private static final int LIMSUP=100;
    
    public Robot()
    {
       nroRobot=proxNro++; //asigna el numero de robot, tambien se podria haber hecho pasandole el numero de robot en el constructor
       vida=(int) (Math.random() * (Robot.LIMSUP - Robot.LIMINF + 1) + Robot.LIMINF );
    }

    public int compareTo(Robot otro)
    {
        return this.vida-otro.vida;
    }
    
    public String toString()
    {
        return "Robot #"+nroRobot+" "+vida+"% de vida"; 
    }
    
    public int getVida()
    {return vida;
    }
}
