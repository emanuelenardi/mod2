(*
	Si consideri il tipo di dato FOR = For of int * (int -> int); i cui valori For(n, f) rappresentano
	funzioni che implementano un ciclo for come il seguente:
	
	int ciclofor (int x) {
		for (int i = 1; i < n; i++) {
			x = f(x);
		}
	}
	
	Si scriva una funzione eval (avente tipo FOR -> (int -> int)) che riceve come argomento un
	valore di tipo FOR e ritorna una funzione da interi ad interi che implementa il ciclo indicato qui sopra
	
	(applica n - 1 volte la funzione f all’argomento).
	Come esempio, se val f = fn x => x * 2, allora eval (For(3, f)) ritornerà una funzione
	che dato un numero i ritorna i = 8:
	
	> val f = fn x => x * 2;
	val f = fn: int -> int
	
	> eval (For(3, f));
	val it = fn: int -> int
	
	> val g = eval (For(3, f));
	val g = fn: int -> int
	
	> g 5;
	val it = 20: int

Soluzione :
*)

(*
	Commento di costruzione :
	La funzione dovrà avere input (FOR -> int) con output -> int.
	For(n,f) è costruito da due paramentri:
		n è l'indice della risoluzione della funzione
		f è la funzione applicata ai cicli n

	fn For(n,f) => fn x => ...
	Inserisco i primi due input (FOR -> int) e traduco il codice descritto sopra in PolyML
	Il For(n,f) ha due traduzioni dal blocco :
		For e il parametro n si possono vedere dal ciclo for (int i = 1; i < n; i++)
		For e il parametro function si ritrovano all'interno del ciclo dove x = f(x);

	Il valore x = f(x); all'interno del ciclo è proprio la x intesa come secondo input del programma ( int )

	ritornando al codice allora dovrò implementare il ciclo for (int i = 1; i < n; i++)
	dato che n sarà il valore che voglio passare allora dovrò controllare il ciclo attraverso n, n-1, n-2 ecc...
	Il blocco per la n passata nella funzione sarà 1, come richiesto dal ciclo for.

	Costruendolo in PolymL :

	fn For(n,f) => fn x =>
	if 1 < n then ...
	else ...

	Adesso per la costruzione di then , il corpo del ciclo for è x = f(x);
	Però il ciclo for si puuò intuire che sarà un richiamo della funzione eval con n-1, questo perchè non utilizzo una variabile i per fare il controlle ( i < n ) ma faccio un controllo di tipo ( 1 < n ), allora il valore da passare sarà una ( n-1 ) :

	fn For(n,f) => fn x =>
	if 1 < n then eval ( For((n-1),f) ) (f x)
	else ...

	Vuol dire che richiamo in ricorsione eval che interpreterà due nuovi parametri For(n-1,f) e (f x)
		For(n-1,f) sarà il ciclo diminuito per il controllo ( 1 < n )... dovrà sicuramente fermarsi prima o poi.
		(f x ) è la traduzione di x = f(x); ovvero passo per parametro una nuova x ottenuta facendo la function su x.

	Finendo l'esercizio manca un default se il parametro n non sarà più grande di 1 dopo un certo numero di cicli.
	La restituzione del tipo è ( -> int ), allora il valore di default da restituire è un intero, l'intero che noi cerchiamo è proprio x.

	fn For(n,f) => fn x =>
	if 1 < n then eval ( For((n-1),f) ) (f x)
	else x

	Il programma ritorna un intero x che è la computazione della funzione f su x per n-1 volte, ovvero:

	For(3,f) x
	E' uguale a dire :
	return f( f(x));

*)

datatype For = For of int * (int -> int);

val rec eval =
fn For(n,function) =>
	fn x => 
		if 1 < n then
			eval (For(n-1,function)) (function x)
		else
			x;

