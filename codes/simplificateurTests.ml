(* Auteurs de ce module: Florian Legendre et Esteban Mauricio *)
(* Objectif de ce module: Ne contenir que les tests des fonctions du projet
                          étant  de notre conception, les fonctions étant 
                          dans le module simplificateur.ml *)

#directory "../librairies/modules_UP/ocaml-4.08.1/";;
#load "expression_scanner.cmo";;
open Expression_scanner;;
open List;;

#use "simplificateurLib.ml";;



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


let tokenListTest3 = string_to_token_list "x 0 + 1 * x / ;";;
let treeTest3 = parse tokenListTest3;;
printAST treeTest3;;
let treeTest3Simplified = simplify treeTest3;;
printAST treeTest3Simplified;;


let tokenListTest4 = string_to_token_list "2 ~ x 2 ~ + 3 4 + ~ / * ;";;
let treeTest4 = parse tokenListTest4;;
printAST treeTest4;;
let treeTest4Simplified = simplify treeTest4;;
printAST treeTest4Simplified;;


let tokenListTest5 = string_to_token_list "a b * c * e f + * ;";;
let treeTest5 = parse tokenListTest5;;
printAST treeTest5;;
let treeTest5Simplified = simplify treeTest5;;
printAST treeTest5Simplified;;


let tokenListTest6 = string_to_token_list "a b c * + ;";;
let treeTest6 = parse tokenListTest6;;
printAST treeTest6;;
let treeTest6Simplified = simplify treeTest6;;
printAST treeTest6Simplified;;
