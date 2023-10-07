#ifndef LISTA_H
#define LISTA_H

/*inclusion(l1,l2,...,ln ; k1,k2..km)
 * {
 *   True, n = 0
 *   False, l1 is not in k1k2..km (check with helper function)
 *   inclusion(l2...ln, k1k2...km), otherwise
 *
 *   ////HELPER FUNCTION////
 *   False, m = 0
 *   True, l1 = k1
 *   helper_function(l1, k2,..,km)
 *
 *   [1,2] [0,0, 4, 2, 1, 9]
 * }
 * */


/*insert(l1,l2,...,ln, e, e1)
 *{
 *    [], n = 0
 *    l1 U el U insertion(l2..ln),  l1 = e
 *    l1 U insert(l2,..,ln, e, e1)
 *}
 * */


//tip de data generic (pentru moment este intreg)
typedef int TElem;

//referire a structurii Nod;
struct Nod;

//se defineste tipul PNod ca fiind adresa unui Nod
typedef Nod *PNod;

typedef struct Nod{
    TElem e;
	PNod urm;
};

typedef struct{
//prim este adresa primului Nod din lista
	PNod _prim;
} Lista;

//operatii pe lista - INTERFATA

//crearea unei liste din valori citite pana la 0
    Lista creare();
//tiparirea elementelor unei liste
    void tipar(Lista l);
// destructorul listei
	void distruge(Lista l);

    Lista insert(Lista list1, TElem e, TElem e2);

    bool inclusion(Lista list1, Lista list2);

    bool helper_inclusion(TElem n1, Lista l2);

    void insertion(Lista list1, TElem e, TElem e2);
#endif
