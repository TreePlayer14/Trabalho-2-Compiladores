%{
	#include <stdio.h>
    #include <string.h>
    #include "TiagoPinheiroCamargo_trabalho.tab.h"
	int linhas=1, erros=0;
%}

DIGITO [0-9]
ID	[A-Za-z][A-Za-z0-9_$]*
ESPACO	[\t\r" "]

%%

{ESPACO} /*reconhece espaço em branco*/

"(" { 
	return (ABRE_PARENTESIS); 
}

")" { 
	return (FECHA_PARENTESIS); 
}

"{" { 
	return (ABRE_CHAVE); 
}

"}" { 
	return (FECHA_CHAVE); 
}

";" { 
	return (SEPARADOR); 
}

"," { 
	return (VIRGULA); 
}

"float" { 
	return (FLOAT); 
}

"int" { 
	return (INT); 
}

"printf" { 
	return (PRINTF); 
}

"void" { 
	return (VOID); 
}

"char" { 
	return (CHAR); 
}

"bool" {
	return (BOOL);
}

"main" { 
	return (MAIN); 
}

"=" { 
	return (IGUAL); 
}



"+" {
	return (OPERADOR);
	//printf("Token Encontrado! Operacao de Soma: %s\n", yytext);
} /* Operação de soma */

"-" {
	return (OPERADOR);
	//printf("Token Encontrado! Operacao de Subtracao: %s\n", yytext);
} /* Operação de subtração*/

"*" {
	return (OPERADOR);
	//printf("Token Encontrado! Operacao de Multiplicacao: %s\n", yytext);
} /*Operação de multiplicação*/

"/" {
	return (OPERADOR);
	//printf("Token Encontrado! Operacao de Divisao: %s\n", yytext);
} /*Operação de divisão*/



"==" {
	return (IGUAL_IGUAL);
	//printf("Token Encontrado! Operador relacional %s\n", yytext);
} /*Operador Igual*/

">=" {
	return (MAIOR_IGUAL);
} /*Operador Maior ou Igual*/

"<=" {
	return (MENOR_IGUAL);
} /*Operador Menor ou Igual*/

"<" {
	return (MENOR);
} /*Operador Menor*/

">" {
	return (MAIOR);
} /*Operador Maior*/

"!=" {
	return (DIFERENTE);
} /*Operador Diferente*/



["]([^"\\\n]|\\(.|\n))*["] {
	return (STRING);
    //printf("Token Encontrado! String: %s\n", yytext);
} /*String*/

"//"[^\n]* {
	return (COMENTARIO);
	//printf("Token Encontrado! Comentarios\n");
} /*Nesta linguagem, há somente comentários simples, ou seja, deve somente comentar uma linha por vez*/



"if" {
	return (IF);
	//printf("Token Encontrado! Palavra Reservada - Comando: %s\n", yytext);
} /* Palavra reservada para o comando if */

"else" {
	return (ELSE);
} /* Palavra reservada para o comando else */

"elif" {
	return (ELIF);
} /* Palavra reservada para o comando elif */

"while" {
	return (WHILE);
} /* Palavra reservada para o comando while */


"true" {
	return (TRUE);
}

"false" {
	return (FALSE);
}

{DIGITO}+{ID} {
	printf("Identificador invalido: %s - ", yytext);
	erros++;
	printf("Linha: %d\n", linhas);
} /*Erro em identificador*/

{ID}{DIGITO}*{ID}* {
	return (IDENTIFICADOR);
	//printf("Token Encontrado! Identificador: %s\n", yytext);
} /*Identificador*/

{DIGITO}+ {
	return (INTEIRO);
	//printf("Token Encontrado! Inteiro: %s\n", yytext);
} /*Números Inteiros*/

{DIGITO}+"."{DIGITO}+ {
	return (REAL);
	printf("Token Encontrado! Real: %s\n", yytext);
} /*Números Reais*/

{DIGITO}+","{DIGITO}+ {
	printf("Configuracao de Numero Real Invalido: %s -", yytext);
	erros++;
	printf("Linha: %d\n", linhas);
} /*Configuração inválida de número real*/

\n {
	linhas++;
} /*Reconhece mudança de linhas*/

. {
	printf("Token invalido: %s -",yytext);
	erros++;
	printf("Linha: $d\n", linhas);
} /*Apresenta erro em qualquer coisa que não for uma regra válida*/

%%

int yywrap(){
	return 1;
}