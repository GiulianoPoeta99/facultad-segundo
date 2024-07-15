package componentes;
/**
 * Indica un tipo de combo Especial, 
 * heredando de la clase padre Combo
 * @author 
 *
 */
public class ComboEspecial extends Combo{

	public ComboEspecial()
	{
		descripcion="Doble Porción de Papas Fritas,3 tipos " +
				"de salsa,doble queso, hamburguesa Especial " +
				"Doble Carne, Doble tomate, gaseosa";
	}
	
	@Override
	public int valor() {
		return 10400;
	}
	
	
}
