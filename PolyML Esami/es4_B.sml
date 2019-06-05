Si scriva una funzione "sommali" (avente tipo int -> int list -> int) che riceve come argomento un intero n ed una lista di interi l.
La funzione sommali somma ad n gli elementi di l che hanno posizione multipla di 3 (se la lista contiene meno di 3 elementi, sommali ritorna n).


Come esempio, l'invocazione

sommali 0 [1,2,3];

deve avere risultato 3,

sommali 1 [1,2,3];

deve avere risultato 4: e

sommali 2 [1,2,3,4,5,6];

deve avere risultato 11.


IMPORTANTE: notare il tipo della funzione!

La funzione sommali deve essere definita in un file.sml autocontenuto ma separato da qualsiasi codice di test si sia usato.
Si consegni il file.sml contenente la definizione di sommali.


Soluzione :

val rec sommali =
fn i:int => (
	fn y::x::z::l => (z) + (sommali i l)
	| x::y::l => (sommali i l)
	| y:: l => (sommali i l)
	| [] => i
);