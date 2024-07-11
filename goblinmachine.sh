#!/bin/bash

clear

# Calculadora de consumiveis para WoW TBC 2.4.3
version=0.0.1

# Variaveis
menu_inicial=""
cod_receita=""

# Menu de opçõe
echo " Calculadora de consumíveis Goblin Machine!"
    
    listar_menu() {
    
    echo " -------- Menu ---------"
    echo " Comando   - Descrição"
    echo " -----------------------"
    echo " receitas  - Mostra a lista de itens consumíveis"
    echo " montar    - Cria uma lista de reagentes"
    echo " exit      - Encerra a sessão"
    echo ""
    
    }
    
echo " v$version"s

# Seleção no Menu Inicial
while true; do

listar_menu

    read -p " Digite uma das opções acima: " menu_inicial
    
        if [[ $menu_inicial == "receitas" ]]; then
            
            echo " Lista de consumíveis:"
            echo ""
            cat itens.txt

        elif [[ $menu_inicial == "montar" ]]; then
            
            echo " Monta uma lista de reagentes"
            read -p " Informe o código de uma das receitas: " cod_receita
        
        elif [[ $menu_inicial == "exit" ]]; then
        
            echo " Saindo ..."
            echo ""
            break
        
        else
        
            echo "Opção desconhecida, escolha novamente uma das abaixo:"
            echo ""
        fi

done

exit