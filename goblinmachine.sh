#!/bin/bash

clear

# Calculadora de consumiveis para WoW TBC 2.4.3
version=0.0.1

# Variaveis
menu_inicial=""
selecao_item=""

# Menu de opçõe
echo " Calculadora de consumíveis Goblin Machine!"
    listar_menu() {
    echo " - Menu -"
    echo " show - Mostrar lista de itens"
    echo " list - Fazer lista de materiais"
    echo " exit - Sair"
    }
echo " v$version"

# Seleção no Menu Inicial
while true; do
echo ""
listar_menu
echo ""
    read -p " Digite uma das opções acima: " menu_inicial
    echo ""
        if [[ $menu_inicial == "show" ]]; then
            echo " Lista de consumíveis:"
            echo ""
            cat itens.txt
            read -p " Selecione um dos itens acima: " selecao_item
            echo ""
        elif [[ $menu_inicial == "list" ]]; then
            echo " Monta uma lista de reagentes"
        elif [[ $menu_inicial == "exit" ]]; then
            echo " Saindo ..."
            echo ""
            break
        else
            echo "Opção desconhecida, escolha novamente uma das abaixo:"
        fi
done

exit