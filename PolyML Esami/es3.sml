(*
	Si consideri il seguente tipo di dato che rappresenta un paziente in arrivo al pronto soccorso :

	datatype codice = rosso of string | giallo of string | verde of string;

	La stringa rappresenta il cognome del paziente, mentre i tre diversi costruttori rosso, giallo e verde rappresentano la gravita' del paziente (codice rosso: massima gravita'/urgenza, codice verde: minima gravita'/urgenza).

	Quando un paziente con codice rosso arriva al pronto soccorso, viene messo in lista d'attesa dopo tutti i pazienti con codice rosso (ma prima di quelli con codice giallo o verde); quando arriva un paziente con codice giallo, viene messo in lista d'attesa dopo tutti i pazienti con codice rosso o giallo (ma prima di quelli con codice verde), mentre quando arriva un paziente con codice verde viene messo in lista d'attesa dopo tutti gli altri pazienti.

	Si scriva una funzione arriva (avente tipo codice list -> codice -> codice list) che riceve come argomenti la lista dei pazienti in attesa (lista di elementi di tipo codice) ed un paziente appena arrivato (elemento di tipo codice) e ritorna la lista aggiornata dei pazienti in attesa (dopo aver inserito il nuovo paziente nel giusto posto in coda).

	Come esempio, l'invocazione :

	> arriva [rosso "topolino", rosso "cip", giallo "ciop", verde "paperino", verde "pluto"] (giallo "clarabella");
	[rosso "topolino", rosso "cip", giallo "ciop", giallo "clarabella", verde "paperino", verde "pluto"]

	IMPORTANTE: notare il tipo della funzione! Si noti inoltre che la funzione usa la tecnica del currying per gestire i due argomenti.

	La funzione arriva deve essere definita in un file .sml separato dalla definizione del tipo di dato codice. Si consegni il file .sml contenente la definizione di arriva.


Soluzione :
*)

datatype codice = rosso of string | giallo of string | verde of string;

val rec arriva = 
fn [] => (fn x:codice => x::[])
| y::l => (fn x:codice => 
	(case x of 
	verde(z) => y::(arriva l x)
	| giallo(z) => (case y of
		verde(z) => x::y::l
		| giallo(z) => y::(arriva l x)
		| rosso(z) => y::(arriva l x)
	)
	| rosso(z) => (case y of
		rosso(z) => y::(arriva l x)
		| giallo(z) => x::y::l
		| verde(z) => x::y::l
		)
	)
)