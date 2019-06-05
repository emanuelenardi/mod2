Si scriva una funzione hist (avente tipo real list -> real * real -> int) che riceve come argomento una lista di real l ed una coppia di real (c, d).
La funzione hist ritorna il numero di elementi della lista compresi nell'intervallo (c - d, c + d), estremi esclusi (vale a dire il numero di elementi r tali che c - d < r < c + d).

IMPORTANTE: notare il tipo della funzione!.

La funzione hist deve essere definita in un file .sml autocontenuto ma separato da qualsiasi codice di test si sia usato.
Si consegni il file .sml contenente la definizione di hist.


Soluzione :

val rec hist =
fn [] => ( fn(c:real,r:real) => 0 )
| e::l => ( fn(c:real , d:real) => if (e>(c-d) andalso e<(c+d)) then 1 + hist l (c,d) else 0 + hist l (c,d) );