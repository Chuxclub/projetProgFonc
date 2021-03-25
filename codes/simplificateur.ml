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

  let simplificationRules tree =
    let opToFunc op =
      match op with
      | Plus -> ( + )
      | Minus -> ( - )
      | Mult -> ( * )
      | Div -> ( / )
    in
    
    match tree with
    | Binary(op, Cst(a), Cst(b)) -> Cst((opToFunc op) a b)
    | Binary(Plus, Cst(0), Var(v)) -> Var(v)
    | Binary(Plus, Var(v), Cst(0)) -> Var(v)
    | Binary(Minus, Var(x), Var(y)) -> if(x = y) then Cst(0) else tree                 
    | Binary(Mult, Cst(1), Var(v)) -> Var(v)
    | Binary(Mult, Var(v), Cst(1)) -> Var(v)
    | Binary(Mult, Cst(0), Var(v)) -> Cst(0)
    | Binary(Mult, Var(v), Cst(0)) -> Cst(0)
    | Binary(Div, Var(x), Var(y)) -> if(x = y) then Cst(1) else tree
    | _ -> tree
  in

  let rec simplify_aux tree rules =
    match tree with
    | Binary(op, l, r) -> rules (Binary(op, simplify_aux l rules, simplify_aux r rules))
    | _ -> tree
  in

  simplify_aux tree simplificationRules
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
