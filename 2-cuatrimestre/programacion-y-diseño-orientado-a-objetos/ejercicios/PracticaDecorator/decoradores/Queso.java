package decoradores;
import componentes.Combo;

/**
 * (Decorator Concreto)
 * clase queso, siendo esta un adicional, 
 * cuenta con una descripcion y un precio
 * @author 
 *
 */
public class Queso extends AdicionalesDecorator{

	Combo combo;
	
	public Queso(Combo combo)
	{
		this.combo=combo;	
	}
	
	@Override
	public String getDescripcion() {
		return combo.getDescripcion()+" , Porci�n de Queso";
	}

	@Override
	public int valor() {
		return 1000+combo.valor();
	}

}