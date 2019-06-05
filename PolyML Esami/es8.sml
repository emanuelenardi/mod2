Scrivere una funzione Standard ML, chiamata elementi_pari, che ha tipo 'a list -> 'a list.

La funzione riceve come parametro una alfa-lista e ritorna una alfa-lista contenente gli elementi della lista di ingresso che hanno posizione pari (il secondo elemento, il quarto elemento, etc...).

Per esempio, "elementi_pari [1,5,2,10]" ritorna "[5,10]"). IMPORTANTE: notare il tipo della funzione!.

Si noti inoltre che la funzione elementi_pari non deve cambiare l'ordine degli elementi della lista rispetto all'ordine della lista ricevuta come argomento (considerando l'esempio precedente, il valore ritornato deve essere [5,10], non [10,5]).

La funzione elementi_pari deve essere definita in un file .sml separato dal codice che la invoca e che viene usato per testarne la correttezza (in altre parole, il file .sml deve contenere solo la definizione della funzione elementi_pari).

Si consegni il file .sml contenente la definizione di elementi_pari.

Si noti che la funzione elementi_pari puo' usare i costruttori forniti da Standard ML per le alfa-liste, senza bisogno di definire alcun datatype o altro.


Soluzione :

val rec elementi_pari =
fn v1::v2::l => v2::(elementi_pari l)
| _ => []