%{
#include "cabecalho.h"
#include <stdio.h>
#include <stdlib.h>
extern int linhas;
extern int erros;
%}

%token ASPAS ABRE_PARENTESIS FECHA_PARENTESIS
%token ABRE_CHAVE FECHA_CHAVE SEPARADOR VIRGULA FLOAT INT PRINTF VOID BOOL CHAR MAIN
%token IDENTIFICADOR INTEIRO REAL STRING OPERADOR COMPARADORES NEGACAO IGUAL COMENTARIO
%token ATRIBUICAO SOMA SUBTACAO MULTIPLICACAO DIVISAO IGUAL_IGUAL MAIOR_IGUAL MENOR_IGUAL MAIOR MENOR DIFERENTE
%token IF ELSE ELIF WHILE FOR TRUE FALSE
%start Programa_principal

%%

//programa principal
Programa_principal: MAIN ABRE_PARENTESIS FECHA_PARENTESIS ABRE_CHAVE Comandos FECHA_CHAVE | error{yyerror("", linhas); }; // não há tipos para a função main, sendo iniciada apenas por main diretamente

Comandos: Comando Comandos | ;

Comando: Declaracao | Atribuicao | Print | Comentario | error{yyerror("", linhas);};


//Sintaxe de Declaração
Declaracao: Tipo Decl SEPARADOR;

Tipo: INT | FLOAT | CHAR | BOOL;

Decl: LISTA_VAR;

LISTA_VAR: IDENTIFICADOR Atribui_valor VIRGULA LISTA_VAR | IDENTIFICADOR Atribui_valor;

Atribui_valor: IGUAL Num | IGUAL String | IGUAL Bool | ;

Num: INTEIRO | REAL;

String: STRING;

Bool: TRUE | FALSE;

//Sintaxe de atribuição

Atribuicao: IDENTIFICADOR IGUAL Exp SEPARADOR;

Exp: INTEIRO x | REAL x | IDENTIFICADOR x;

x: OPERADOR Exp | ;


//Sintaxe de impressão
Print: PRINTF ABRE_PARENTESIS STRING FECHA_PARENTESIS SEPARADOR; // não há reconhecimento de acentos e caracteres especiais no comando de impressão da linguagem, sendo o comando apenas para exibir mensagens de alerta ou algum comunicado ao usuário na tela

//Qualquer_palavra: IDENTIFICADOR y;

//y: IDENTIFICADOR y | ;


//Sintaxe de comentário
Comentario: COMENTARIO;


//Sintaxe de Operadores Aritméticos




%%
FILE *yyin;

int yyerror(char *str, int num_linha)
{
	if(strcmp(str,"syntax error")==0)
	{
		erros++;
	}
	else
	{
		printf("O erro aparece proximo a linha %d\n", num_linha);//Exibe a linha do erro
	}
	return erros;
}

int main (int argc, char **argv ){
	++argv, --argc; //desconsidera o nome do programa
	if ( argc > 0 )
		yyin = fopen( argv[0], "r" );
	else{
		puts("Falha ao abrir arquivo, nome incorreto ou não especificado. Digite o comando novamente."); //exibe mensagem de texto se o arquivo não for especificado ou for especificado com o nome errado
		exit(0);
	}

	do{
		yyparse();
	}while(!feof(yyin));//enquanto não chegar ao fim do arquivo faz as análises
	
	if(erros==0)//Se não houver erros, imprime mensagem de fim de análise com sucesso
		puts("Analise concluida com sucesso");

}
