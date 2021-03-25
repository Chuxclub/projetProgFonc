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
(* ============== Fonction Parse =============== *)
(* ============================================= *)

let parse tokenList =
  let rec parse_aux tokenList treeStack =  
    match tokenList with
    | [] -> failwith "Error in parse() in simplificateur.ml. Parameter tokenList is empty!"
    | hd::tl ->
       match hd with
       | Variable(v) -> parse_aux tl ((Var(v))::treeStack)
       | Number(n) -> parse_aux tl ((Cst(n))::treeStack)
       | End -> List.hd treeStack
              
       | Add -> let (a,b) = ((List.hd treeStack), (List.hd (List.tl treeStack))) in
                let newTreeStack = List.tl (List.tl treeStack) in
                parse_aux tl ((Binary(Plus, b, a))::newTreeStack)
                
       | Subtract -> let (a,b) = ((List.hd treeStack), (List.hd (List.tl treeStack))) in
                     let newTreeStack = List.tl (List.tl treeStack) in
                     parse_aux tl ((Binary(Minus, b, a))::newTreeStack)
                     
       | Multiply -> let (a,b) = ((List.hd treeStack), (List.hd (List.tl treeStack))) in
                     let newTreeStack = List.tl (List.tl treeStack) in
                     parse_aux tl ((Binary(Mult, b, a))::newTreeStack)
                     
       | Divide -> let (a,b) = ((List.hd treeStack), (List.hd (List.tl treeStack))) in
                   let newTreeStack = List.tl (List.tl treeStack) in
                   parse_aux tl ((Binary(Div, b, a))::newTreeStack)
                   
       | Minus -> parse_aux tl ((Unary(List.hd treeStack))::(List.tl treeStack))
  in
  
  parse_aux tokenList []
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
