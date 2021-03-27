(* Auteurs de ce module: Florian Legendre et Esteban Mauricio *)
(* Objectif de ce module: Contenir le programme de simplification 
                          qui sera compilé *)

open List;;
open Expression_scanner;;
open SimplificateurLib;;

let tokenList= input_to_token_list();;
let tree = parse tokenList;;
printAST tree;;
let treeSimplified = simplify tree;;
printAST treeSimplified;;
