import java.util.Calendar;
import java.util.Date;

public class RelojQueAtrasa extends Thread {

private static RelojQueAtrasa instance; 
   
Calendar hora;

private RelojQueAtrasa() {
hora=Calendar.getInstance();
this.start();
}

public static synchronized RelojQueAtrasa getInstance()
{ 
  if (instance==null) instance=new RelojQueAtrasa();
  return instance;  
}

@Override
public void run() {
while (true) {
hora.add(Calendar.SECOND, 1);
try {
sleep(2000);
} catch (InterruptedException e) {
e.printStackTrace();
}
}
}

public Date getHora(){ return hora.getTime();}

}