Si consideri una possibile implementazione degli insiemi di interi in standard ML, in cui un insieme di interi e' rappresentato da una funzione da int a bool:

type insiemediinteri = int -> bool;


La funzione applicata ad un numero intero ritorna true se il numero appartiene all'insieme, false altrimenti. L'insieme vuoto e' quindi rappresentato da una funzione che ritorna sempre false:

val vuoto:insiemediinteri = fn n => false;


ed un intero puo' essere aggiunto ad un insieme tramite la funzione aggiungi:

val aggiungi = fn f:insiemediinteri => fn x:int =>
(fn n:int => if (n = x) then
	true
else
	false
):insiemediinteri;


E' possibile verificare se un intero e' contenuto in un insieme tramite la funzione contiene:

val contiene = fn f:insiemediinteri => fn n:int => f n;


Si implementi la funzione unnione, avente tipo insiemediinteri -> insiemediinteri -> insiemediinteri, che dati due insiemi di interi ne calcola l'unione.

IMPORTANTE: notare il tipo della funzione! Come si puo' intuire da tale tipo, usa la tecnica del currying per gestire i suoi due argomenti.

La funzione unione deve essere definita in un file .sml separato dalle definizioni di insiemediinteri, vuoto, aggiungi e contiene. Si consegni il file .sml contenente la definizione di unione. Si noti che la funzione unione puo' usare le definizioni di cui sopra nella sua implementazione. Non occorre ripetere tali definizioni.

val aggiungi = fn f:insiemediinteri => fn x:int => (fn n:int => if (n = x) then true else fn):insiemediinteri;


Soluzione :

val unione = 
fn i1:insiemediinteri => fn i2:insiemediinteri =>
(fn n =>
	((contiene i1 n) orelse (contiene i2 n))
):insiemediinteri;
