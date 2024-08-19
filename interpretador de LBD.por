programa
{
	inclua biblioteca Texto --> tx
	inclua biblioteca Arquivos --> a
	
	funcao inicio()
	{
		inteiro codigo = a.abrir_arquivo("D:\\Allyson\\LDB\\Teste.txt", a.MODO_LEITURA)
		interpretador(codigo)
	}

	funcao interpretador(inteiro URL)
	{	
		inteiro codigo2 = a.abrir_arquivo("D:\\Allyson\\LDB\\programa.por", a.MODO_ESCRITA)
		
		faca{
			cadeia linha = a.ler_linha(URL)
			//existe?
			inteiro cp = tx.posicao_texto("programa", linha, 0)
			inteiro ci = tx.posicao_texto("inicio", linha, 0)
			inteiro cf = tx.posicao_texto("funcao", linha, 0)
			tx.posicao_texto("mostre", linha, 0)
			tx.posicao_texto("guarde", linha, 0)
			tx.posicao_texto("limpe", linha, 0)
			tx.posicao_texto("se", linha, 0)
			tx.posicao_texto("senao", linha, 0)
			tx.posicao_texto("fimse", linha, 0)
			tx.posicao_texto("escolha", linha, 0)
			tx.posicao_texto("caso", linha, 0)
			tx.posicao_texto("pare", linha, 0)
			tx.posicao_texto("fimescolha", linha, 0)
			tx.posicao_texto("enquanto", linha, 0)
			tx.posicao_texto("fimenquanto", linha, 0)
			tx.posicao_texto("repita", linha, 0)
			tx.posicao_texto("ate", linha, 0)
			tx.posicao_texto("para", linha, 0)
			tx.posicao_texto("faca", linha, 0)
			tx.posicao_texto("var", linha, 0)
			tx.posicao_texto("matriz", linha, 0)
			tx.posicao_texto("fim", linha, 0)
			inteiro ppa = tx.posicao_texto("(", linha, 0)

			se(cp != -1)//programa
			{
				linha = "programa\n{\n"
			}

			se(ci != -1)
			{
				linha = "funcao inicio()\n{\n"
			}

			se(cf != -1)
			{
				linha = "funcao " + tipo(cf+5,linha)+ "( " + parametros(ppa,linha) + ")"
			}
			a.escrever_linha(linha, codigo2)
		}enquanto(nao a.fim_arquivo(URL))
	}

	funcao cadeia tipo(inteiro p, cadeia linha)
	{
			inteiro cn = tx.posicao_texto("numero", linha, 0)
			inteiro ct = tx.posicao_texto("texto", linha, 0)
			inteiro cl = tx.posicao_texto("logico", linha, 0)			
			inteiro cv = tx.posicao_texto("vazio", linha, 0)

			se(cn != -1){
				retorne "real" + id(cn,linha)
			}senao se(ct != -1){
				retorne "cadeia" + id(cn,linha)
			}senao se(cl != -1){
				retorne "logico" + id(cn,linha)
			}senao{
				retorne "" + id(cn,linha)
			}
	}

	funcao cadeia id(inteiro p, cadeia linha)
	{
		inteiro pp = tx.posicao_texto(linha, "(", p)
		retorne " " +tx.extrair_subtexto(linha, p, pp )
	}

	funcao cadeia parametros(inteiro p, cadeia linha)
	{
		inteiro ppf = tx.posicao_texto(")", linha, 0)
		inteiro pv = tx.posicao_texto(",", linha, 0)
		se(pv != -1)
		{
			retorne tx.extrair_subtexto(linha, pa, pv)
		}
		
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2510; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */