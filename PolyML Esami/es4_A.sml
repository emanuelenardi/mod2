(*
	Si scriva una funzione "sommali" (avente tipo int -> int list -> int) che riceve come argomento un intero n ed una lista di interi l.
	La funzione sommali somma ad n gli elementi di l che hanno posizione pari (se la lista contiene meno di 2 elementi, sommali ritorna n).


	Come esempio, l'invocazione

	> sommali 0 [1,2];
	> val it = 2: int;

	> sommali 1 [1,2,3];
	> val it = 3: int;

	sommali 2 [1,2,3,4];
	> val it = 8: int;


	IMPORTANTE: notare il tipo della funzione!

	La funzione sommali deve essere definita in un file.sml autocontenuto ma separato da qualsiasi codice di test si sia usato.
	Si consegni il file.sml contenente la definizione di sommali.


Soluzione :
*)

val rec sommali =
fn i:int => (
	fn x::z::l => (z) + (sommali i l)
	| y::l => (sommali i l)
	| [] => i
);