#include "lista.h"
#include <iostream>

using namespace std;


PNod creare_rec(){
      TElem x;
      cout << "x=";
      cin >> x;
      if (x==-1)
        return NULL;
      else
      {
            PNod p=new Nod();
            p->e=x;
            p->urm=creare_rec();
            return p;
      }
}

Lista creare(){
   Lista l;
   l._prim=creare_rec();
}

PNod creare_nod(TElem data) ///helper function to create a new node so we can return it as an "empty list" when adding
{
    PNod new_node = new Nod();
    new_node->e = data;
    new_node->urm = nullptr;

    return new_node;

}

//create a function that creates an EMPTY LIST

void creare_lista(Lista list, TElem e)
{
    PNod p = new Nod();
    p->e = e;
    p->urm = nullptr;
    list._prim = p;
}

void tipar_rec(PNod p){
   if (p!=NULL){
     cout<<p->e<<" ";
     tipar_rec(p->urm);
   }
}

void tipar(Lista l){
   tipar_rec(l._prim);
}

void distrug_rec(PNod p){
   if (p != NULL){
     distrug_rec(p->urm);
     delete p;
   }
}

bool inclusion(Lista list1, Lista list2) {
    if (list1._prim == nullptr)
        return true;
    if (!helper_inclusion(list1._prim->e, list2))
        return false;

    else
    {
        list1._prim = list1._prim->urm;
        return inclusion(list1, list2);
    }
}

bool helper_inclusion(TElem n1, Lista l2)
{
    if(l2._prim == nullptr)
        return false;
    if(n1 == l2._prim->e)
        return true;
    else
    {
        l2._prim = l2._prim->urm;
        return helper_inclusion(n1, l2);
    }
}


/*insert(l1,l2,...,ln, e, e1)
 *{
 *    [], n = 0
 *    l1 U el U insertion(l2..ln),  l1 = e
 *    l1 U insert(l2,..,ln, e, e1)
 *}
 * */

Lista insert(Lista list, TElem e, TElem e2)
{
    if(list._prim == nullptr)
    {
        Lista new_list; //create a new empty list
        return new_list;
    }
    if(list._prim->e == e)
    {
        ///
        PNod aux = list._prim->urm;
        PNod added_nod = creare_nod(e2);
        list._prim->urm = added_nod;
        added_nod->urm = aux;

        list._prim = list._prim->urm->urm; ///we skip 2 elements since we inserted one
        insert(list, e, e2);
    }
    else {
        list._prim = list._prim->urm;
        insert(list, e, e2);
    }

}


void distrug(Lista l) {
	//se elibereaza memoria alocata nodurilor listei
    distrug_rec(l._prim);
}



