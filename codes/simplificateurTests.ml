(* Auteurs de ce module: Florian Legendre et Esteban Mauricio *)
(* Objectif de ce module: Ne contenir que les tests des fonctions du projet
                          étant  de notre conception, les fonctions étant 
                          dans le module simplificateur.ml *)

#directory "../librairies/modules_UP/ocaml-4.08.1/";;
#load "expression_scanner.cmo";;
open Expression_scanner;;

#use "simplificateur.ml";;




(* ============================================= *)
(* ============== Fonction Parse =============== *)
(* ============================================= *)

let tokenListTest1 = string_to_token_list "13 2 5 * 1 0 / - + ;";;
let treeTest1 = parse tokenListTest1;;
printAST treeTest1;;
