#include "lista.h"
#include <iostream>


/*inclusion(l1,l2,...,ln ; k1,k2..kn)
 * {
 *      list1 = null  => return true
 *      list2 = null  => return false
 *
 *      if(l1.elem = k1.elem)  => inclusion(l2.., k2..)
 *      else if l1.elem != k1.elem => inclusion(l1.., k2..)
 * }
 * */





int main()
{
//   Lista l1, l2;
//    l1 = creare();
//    std::cout << "Lista 1 a fost creata!" << std::endl;
//    l2 = creare();
//    std::cout << "Lista 2 a fost creata!" << std::endl;
//
//    if(inclusion(l1, l2))
//        std::cout << "Inclusa" << std::endl;
//    else
//        std::cout << "Nu e inclusa" << std::endl;



    Lista l1;
    l1 = creare();
    std::cout << "Lista 1 a fost creata!" << std::endl;

    insert(l1, 2, 2);
    tipar(l1);
}
