#!/bin/bash

clear

# Calculadora de consumiveis para WoW TBC 2.4.3
version=0.0.1

# Variaveis
menu_inicial=""

# Menu de opçõe
echo ""
echo " Calculadora de consumíveis Goblin Machine!"
    listar_menu() {
    echo "  show - Mostrar lista de itens"
    echo "  list - Fazer lista de materiais"
    echo "  exit - Sair"
    echo ""
    }
echo " v$version"
echo ""

# Seleção no Menu Inicial
while true; do
listar_menu
    read -p "Digite uma das opções acima: " menu_inicial
        if [[ $menu_inicial == "show" ]]; then
            echo "  Mostra a lista de itens"
            echo ""
        elif [[ $menu_inicial == "list" ]]; then
            echo "  Monta uma lista de itens necessários"
            echo ""
        elif [[ $menu_inicial == "exit" ]]; then
            echo "Saindo ..."
            echo ""
            break
        else
            echo "Opção desconhecida, escolha novamente uma das abaixo:"
        fi
done

exit