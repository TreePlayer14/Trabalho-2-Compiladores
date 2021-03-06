
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ASPAS = 258,
     ABRE_PARENTESIS = 259,
     FECHA_PARENTESIS = 260,
     ABRE_CHAVE = 261,
     FECHA_CHAVE = 262,
     SEPARADOR = 263,
     VIRGULA = 264,
     FLOAT = 265,
     INT = 266,
     PRINTF = 267,
     VOID = 268,
     BOOL = 269,
     CHAR = 270,
     MAIN = 271,
     IDENTIFICADOR = 272,
     INTEIRO = 273,
     REAL = 274,
     STRING = 275,
     OPERADOR = 276,
     COMPARADORES = 277,
     NEGACAO = 278,
     IGUAL = 279,
     COMENTARIO = 280,
     ATRIBUICAO = 281,
     SOMA = 282,
     SUBTACAO = 283,
     MULTIPLICACAO = 284,
     DIVISAO = 285,
     IGUAL_IGUAL = 286,
     MAIOR_IGUAL = 287,
     MENOR_IGUAL = 288,
     MAIOR = 289,
     MENOR = 290,
     DIFERENTE = 291,
     IF = 292,
     ELSE = 293,
     ELIF = 294,
     WHILE = 295,
     TRUE = 296,
     FALSE = 297
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


