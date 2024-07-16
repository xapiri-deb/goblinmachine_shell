#!/bin/bash
#
# goblinmachine.sh - Calcula o número de reagentes de consumíveis no WoW TBC 2.4.3
#
# site          : https://github.com/xapiri-deb
# autor         : ghost-deb
# e-mail        : ???
# 
# Goblin Machine Shell é uma calculadora com banco de dados construida em shell
# para realizar cálculo de materiais necessário na produção de itens consumíveis
# em World of Warcraft The Burned Crusade 2.4.3 (WoW TBC 2.4.3)
#
# Licença: GNU General Public License v3.0

clear

# Calculadora de consumiveis para WoW TBC 2.4.3
version=0.0.1

# Variaveis
menu_inicial=""
cod_receita=""
needmore_receita=""
nx_receita=""
vcod_receita=()
vnx_receita=()
i=0

# Menu de opções
echo " Calculadora de consumíveis Goblin Machine!"
echo " v$version"s    

# Lista Menu Inicial
MenuInicial() {
    echo " receitas - Criar lista de reagentes."
    echo " exit     - Encerrar sessão."
    echo ""
}

# Lista Menu de Receitas
MenuReceitas() {
    read -p " Informe o código de uma receita: " cod_receita 
    vcod_receita+=("$cod_receita")
    read -p " Informe o número de unidades para esta receita: " nx_receita
    vnx_receita+=("$nx_receita")
    read -p " Deseja fazer outras receitas Sim (s) Não (n)?" needmore_receita
}

# Seleção no Menu Inicial
while true; do

   MenuInicial
   
   read -p " Digite uma das opções acima: " menu_inicial
    
    if [[ $menu_inicial == "receitas" ]]; then
            
        echo " Lista de consumíveis:"
        cat itens.txt
        echo " "
                        
            while true; do
                
                MenuReceitas
            ()
                if [[ $needmore_receita == "s" ]]; then

                    continue
                    
                elif [[ $needmore_receita == "n" ]]; then

                    echo " Lista de Consumíveis solicitados"
                    echo " Calculando reagentes necessários..."
                    echo "" # Imprime a lista de reagentes
                    break

                else

                    echo " Opção inválida... Deseja fazer outras receitas Sim (s) Não (n)?"
                    echo ""

                fi

            done

        exit

    elif [[ $menu_inicial == "exit" ]]; then
        
        echo " Saindo ..."
        echo ""
        break
        
    else
        
        echo " Opção desconhecida, escolha novamente uma das abaixo:"
        echo ""

    fi

done

exit