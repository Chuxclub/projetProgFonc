# Projet de Programmation Fonctionnelle

##Objectif: 
Implanter un parser d'expressions mathématiques simple sur la base de la notation polonaise inversée


##Deadline: 
09/04/2021


##Auteurs de ce projet:
Florian Legendre & Esteban Mauricio


##Comment utiliser notre programme:
1) Ouvrir un terminal Bash
2) Aller dans le dossier codes/
3) Entrer ./simplificateur
4) Entrer une chaîne de caractère correspondant à une **expression en notation polonaise inversée**
   Ex. 2 ~ x 2 ~ + 3 4 + ~ / * ;
5) Appuyer sur Entrée __puis__ sur Ctrl+D


##Hiérarchie de fichiers:
.
├── codes
│   ├── #
│   │   └── archives
│   ├── simplificateur
│   ├── simplificateurLib.ml
│   ├── simplificateurLib.ml~
│   ├── simplificateur.ml
│   ├── simplificateur.ml~
│   ├── simplificateurTests.ml
│   └── simplificateurTests.ml~
├── docs
│   └── projet-0e.pdf
├── librairies
│   ├── #
│   │   └── Module Expression_scanner, différentes versions selon votre version dOcaml-20210315.zip
│   ├── modules_Etu
│   │   └── ocaml-4.08.1
│   │       ├── simplificateur.cmi
│   │       ├── simplificateur.cmo
│   │       ├── simplificateurLib.cmi
│   │       └── simplificateurLib.cmo
│   └── modules_UP
│       ├── expression_scanner.cmi
│       ├── expression_scanner.mli
│       ├── ocaml-4.02.1+ocp1
│       │   ├── expression_scanner.cmi
│       │   └── expression_scanner.cmo
│       ├── ocaml-4.02.3
│       │   ├── expression_scanner.cmi
│       │   └── expression_scanner.cmo
│       ├── ocaml-4.05.0
│       │   ├── expression_scanner.cmi
│       │   └── expression_scanner.cmo
│       ├── ocaml-4.08.1
│       │   ├── expression_scanner.cmi
│       │   └── expression_scanner.cmo
│       ├── ocaml-4.10.0
│       │   ├── expression_scanner.cmi
│       │   └── expression_scanner.cmo
│       └── ocaml-4.11.1
│           ├── expression_scanner.cmi
│           └── expression_scanner.cmo
└── README.md

14 directories, 29 files

