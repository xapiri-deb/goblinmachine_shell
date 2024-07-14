#!/bin/bash

clear

# Calculadora de consumiveis para WoW TBC 2.4.3
version=0.0.1

# Variaveis
menu_inicial=""
cod_receita=""
nx_receita=""
needmore_receita=""

# Menu de opções
echo " Calculadora de consumíveis Goblin Machine!"
echo " v$version"s    

# Lista Menu Inicial
listar_menu() {
    echo " ------------- Menu --------------"
    echo " Comando  - Descrição"
    echo " ---------------------------------"
    echo " receitas - Criar lista de reagentes."
    echo " exit     - Encerrar sessão."
    echo ""
}

# Lista Menu de Receitas
menu_receitas() {
    read -p " Informe o código de uma receita: " cod_receita
    read -p " Informe o número de unidades para esta receita: " nx_receita
    read -p " Deseja fazer outras receitas Sim (s) Não (n)?" needmore_receita
}

# Seleção no Menu Inicial
while true; do

   listar_menu
   
   read -p " Digite uma das opções acima: " menu_inicial
    
    if [[ $menu_inicial == "receitas" ]]; then
            
        echo " Lista de consumíveis:"
        cat itens.txt
        echo " "
                        
            while true; do
                
                menu_receitas

                if [[ $needmore_receita == "s" ]]; then

                    continue
                    
                elif [[ $needmore_receita == "n" ]]; then

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