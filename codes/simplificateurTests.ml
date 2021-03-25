(* Auteurs de ce module: Florian Legendre et Esteban Mauricio *)
(* Objectif de ce module: Ne contenir que les tests des fonctions du projet
                          étant  de notre conception, les fonctions étant 
                          dans le module simplificateur.ml *)

#directory "../librairies/modules_UP/ocaml-4.08.1/";;
#load "expression_scanner.cmo";;
open Expression_scanner;;
open List;;

#use "simplificateur.ml";;




(* ============================================= *)
(* ============== Fonction Parse =============== *)
(* ============================================= *)

let tokenListTest1 = string_to_token_list "13 2 5 * 4 2 / - + ;";;
let treeTest1 = parse tokenListTest1;;
printAST treeTest1;;
let treeTest1Simplified = simplify treeTest1;;
printAST treeTest1Simplified;;


let tokenListTest2 = string_to_token_list "x 3 + 5 7 + + 3 4 * 1 3 + / / ;";;
let treeTest2 = parse tokenListTest2;;
printAST treeTest2;;
let treeTest2Simplified = simplify treeTest2;;
printAST treeTest2Simplified;;
