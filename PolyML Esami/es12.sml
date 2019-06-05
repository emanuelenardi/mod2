Si consideri il tipo di dato

datatype lambda_expr = Var of string
					 | Lambda of string * lambda_expr
					 | Apply of lambda_expr * lambda_expr;

che rappresenta un'espressione del Lambda-calcolo.

Il costruttore Var crea un'espressione costituita da un'unica funzione / variabile (il cui nome e' un valore di tipo string);
il costruttore Lambda crea una Lambda-espressione a partire da un'altra espressione, legandone una variabile (indicata da un valore di tipo string);
il costruttore Apply crea un'espressione data dall'applicazione di un'espressione ad un'altra.

Si scriva una funzione is_free (avente tipo string -> lambda_expr -> bool) che riceve come argomenti una stringa (che rappresenta il nome di una variabile / funzione) ed una Lambda-espressione,
ritornando true se la variabile indicata appare come libera nell'espressione,
false altrimenti (quindi, la funzione ritorna false se la variabile e' legata o se non appare nell'epressione).

Come esempio, l'invocazione

is_free "a" (Var "a");

deve avere risultato true, l'invocazione

is_free "b" (Var "a");

deve avere risultato false, l'invocazione

is_free "a" (Lambda ("a", Apply((Var "a"), Var "b")));

deve avere risultato false, l'invocazione

is_free "b" (Lambda ("a", Apply((Var "a"), Var "b")));

deve avere risultato true e cosi' via.

IMPORTANTE: notare il tipo della funzione! La funzione usa la tecnica del currying per gestire i due argomenti.

La funzione is_free deve essere definita in un file .sml separato dalla definizione del tipo di dato lambda_expr. Si consegni il file .sml contenente la definizione di is_free.


Soluzione :

val rec is_free_rec =
fn Var(x) => ( fn str => str=x )
| Lambda(x,le) => ( fn str => if str=x then false else (is_free_rec le str) )
| Apply(le1,le2) => ( fn str => (is_free_rec le1 str) orelse (is_free_rec le2 str) );

fun is_free str var = is_free_rec var str;