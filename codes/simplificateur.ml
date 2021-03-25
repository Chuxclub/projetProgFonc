(* Auteurs de ce module: Florian Legendre et Esteban Mauricio *)
(* Objectif de ce module: Ne contenir que les fonctions du projet qui 
                          sont de notre conception, les tests de ces 
                          fonctions étant réalisés dans le module 
                          simplificateurTests.ml (ce module utilisant 
                          les fonctions définies ici) *)



(* ============================================= *)
(* ==== Type des arbres de syntaxe abstraite === *)
(* ============================================= *)

type operator =
  | Plus
  | Minus
  | Mult
  | Div
;;

type tree =
  | Var of char
  | Cst of int
  | Unary of tree
  | Binary of operator * tree * tree
;;


(* ============================================= *)
(* ============== Fonction parse =============== *)
(* ============================================= *)

let parse tokenList =
  hd( fold_left (
          fun treeStack elem ->
          match elem with
          | End -> treeStack
          | Variable(v) -> Var(v)::treeStack
          | Number(n) -> Cst(n)::treeStack
          | Minus -> Unary(hd treeStack)::(tl treeStack)
          | Add -> Binary(Plus, hd (tl treeStack), hd treeStack)::(tl (tl treeStack))
          | Subtract -> Binary(Minus, hd (tl treeStack), hd treeStack)::(tl (tl treeStack))
          | Multiply -> Binary(Mult, hd (tl treeStack), hd treeStack)::(tl (tl treeStack))
          | Divide -> Binary(Div, hd (tl treeStack), hd treeStack)::(tl (tl treeStack))
        )
        
        [] tokenList)
;;




(* ============================================= *)
(* ============ Fonction simplify ============== *)
(* ============================================= *)

let simplify tree =
  let rec simplify_aux tree opToFunc =
    match tree with
    | Binary(operator, Cst(a), Cst(b)) -> Cst(((opToFunc operator) a b))
    | _ -> tree
  in

  simplify_aux tree (fun op -> match op with
                               | Plus -> ( + )
                               | Minus -> ( - )
                               | Mult -> ( * )
                               | Div -> ( / ))
;;


(* ============================================= *)
(* ============ Fonction printAST ============== *)
(* ============================================= *)


let printAST tree = 
  let rec printAST_aux tree =
    match tree with
    | Var(v) -> print_char v
    | Cst(n) -> print_int n
    | Unary(t) -> print_char '~'; printAST_aux(t);
    | Binary(operator, l, r) ->
       (
         printAST_aux l;
         
         (match operator with
          | Plus -> print_string " + "
          | Minus -> print_string " - "
          | Mult -> print_string " x "
          | Div -> print_string " / ");
         
         printAST_aux r;
       );
  in
  printAST_aux tree;
  print_newline();
;;
