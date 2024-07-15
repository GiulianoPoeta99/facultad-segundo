import java.util.Map;
import java.util.Stack;

// Interfaz Expression que declara el método interpret
interface Expression {
    int interpret(Map<String, Integer> context);
}

// Clase concreta que implementa la interfaz Expression para evaluar una variable
class VariableExpression implements Expression {
    private String variable;

    public VariableExpression(String variable) {
        this.variable = variable;
    }

    @Override
    public int interpret(Map<String, Integer> context) {
        return context.getOrDefault(variable, 0);
    }
}

// Clase concreta que implementa la interfaz Expression para evaluar una constante
class ConstantExpression implements Expression {
    private int value;

    public ConstantExpression(int value) {
        this.value = value;
    }

    @Override
    public int interpret(Map<String, Integer> context) {
        return value;
    }
}

// Clase concreta que implementa la interfaz Expression para evaluar una suma
class AddExpression implements Expression {
    private Expression left;
    private Expression right;

    public AddExpression(Expression left, Expression right) {
        this.left = left;
        this.right = right;
    }

    @Override
    public int interpret(Map<String, Integer> context) {
        return left.interpret(context) + right.interpret(context);
    }
}

// Clase concreta que implementa la interfaz Expression para evaluar una resta
class SubtractExpression implements Expression {
    private Expression left;
    private Expression right;

    public SubtractExpression(Expression left, Expression right) {
        this.left = left;
        this.right = right;
    }

    @Override
    public int interpret(Map<String, Integer> context) {
        return left.interpret(context) - right.interpret(context);
    }
}

// Clase que representa el contexto
class Context {
    private Map<String, Integer> variables;

    public Context(Map<String, Integer> variables) {
        this.variables = variables;
    }

    public Map<String, Integer> getVariables() {
        return variables;
    }
}

// Clase que utiliza el patrón Interpreter
class InterpreterClient {
    public static void main(String[] args) {
        // Crear expresiones aritméticas
        Expression expression = new AddExpression(
            new VariableExpression("x"),
            new SubtractExpression(
                new ConstantExpression(10),
                new VariableExpression("y")
            )
        );

        // Definir el contexto con valores para las variables
        Context context = new Context(Map.of("x", 15, "y", 5));

        // Evaluar la expresión con el contexto dado
        int result = expression.interpret(context.getVariables());

        System.out.println("El resultado de la expresión es: " + result);
    }
}
