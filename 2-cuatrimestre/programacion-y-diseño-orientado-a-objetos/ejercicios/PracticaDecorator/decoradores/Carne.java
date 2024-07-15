package decoradores;
import componentes.Combo;


/**
 * (Decorator Concreto)
 * clase Carne, siendo esta un adicional,
 * cuenta con una descripcion y un precio
 * @author 
 *
 */
public class Carne extends AdicionalesDecorator{

	Combo combo;
	
	public Carne(Combo combo)
	{
		this.combo=combo;	
	}
	
	@Override
	public String getDescripcion() {
		return combo.getDescripcion()+" , Porci�n de Carne";
	}

	@Override
	public int valor() {
		return 2500+combo.valor();
	}
}
