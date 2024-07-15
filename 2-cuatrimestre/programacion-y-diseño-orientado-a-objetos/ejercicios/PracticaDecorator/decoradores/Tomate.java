package decoradores;
import componentes.Combo;

/**
 * (Decorator Concreto)
 * clase tomate, siendo esta un adicional, 
 * cuenta con una descripcion y un precio
 * @author 
 *
 */
public class Tomate extends AdicionalesDecorator{

	Combo combo;
	
	public Tomate(Combo combo)
	{
		this.combo=combo;
	}

	
	@Override
	public String getDescripcion() {
		return combo.getDescripcion()+" , Porci�n de Tomate";
	}

	@Override
	public int valor() {
		return 100+combo.valor();
	}

}
