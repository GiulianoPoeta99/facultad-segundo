package componentes;

/**
 * Indica un tipo de combo basico, 
 * heredando de la clase padre Combo
 * @author 
 *
 */
public class ComboBasico extends Combo{

	public ComboBasico() {
		descripcion="Porción de Papas Fritas, " +
			"salsa, queso, hamburguesa sencilla, gaseosa";
	}
	
	@Override
	public int valor() {
		return 6200;
	}
}
