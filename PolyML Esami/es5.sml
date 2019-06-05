Si scriva una funzione noduplen (avente tipo ''a list -> int) che riceve come argomento una lista di ''a l.
La funzione noduplen ritorna il numero di elementi della lista senza considerare i duplicati.

Come esempio, l'invocazione noduplen ["pera", "pera", "pera", "pera"]; deve avere risultato 1 e noduplen ["red", "red", "green", "blue"]; deve avere risultato 3.

IMPORTANTE: notare il tipo della funzione!.

La funzione noduplen deve essere definita in un file .sml autocontenuto ma separato da qualsiasi codice di test si sia usato.
Si consegni il file .sml contenente la definizione di noduplen.


Soluzione :

val rec noduplen =
fn y::x::l => if x=y then 0 + noduplen (x::l) else 1 + noduplen (x::l)
| y::l => 1
| [] => 0