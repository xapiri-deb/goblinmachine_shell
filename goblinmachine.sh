#!/bin/bash
#
# Goblin Machine Shell
#
# goblinmachine.sh - Script para calcular o número de reagentes de consumíveis no WoW TBC 2.4.3
#
# site          : https://github.com/xapiri-deb
# autor         : ghost-deb
# e-mail        : momonomono@tutanota.com
# 
# Goblin Machine Shell é uma calculadora com banco de dados construida em shell
# para calcular os materiais necessário na produção de itens consumíveis
# em World of Warcraft: The Burned Crusade 2.4.3 (WoW TBC 2.4.3)
#
# Histórico de Versões:
# 
# [0.0.1] - 2024-07-09
# - Início da Estrutura do código.
# 
# Licença: 
#
# GNU General Public License v3.0
#
# Este arquivo faz parte do projeto Goblin Machine Shell.
# 
# Goblin Machine Shell é um software livre: você pode redistribuí-lo e/ou modificá-lo
# sob os termos da Licença Pública Geral GNU, conforme publicada pela
# Free Software Foundation, tanto a versão 3 da Licença quanto (à sua opção)
# qualquer versão posterior.
# 
# Goblin Machine Shell é distribuído na esperança de que seja útil,
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a qualquer
# MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
# Licença Pública Geral GNU para mais detalhes.
# 
# Você deveria ter recebido uma cópia da Licença Pública Geral GNU junto com o
# Goblin Machine Shell. Se não, veja <https://www.gnu.org/licenses/>.
# 
# Resumo da Licença:
# - Você pode livremente usar, modificar e distribuir este software.
# - Este software é fornecido "como está", sem garantias ou condições de qualquer tipo.
# - Veja a Licença Pública Geral GNU para mais detalhes.
#

clear

version=0.0.1

# Variaveis
menu_inicial=""
cod_receita=""
mais_receita=""
nx_receita=""
vcod_receita=()
vnx_receita=()
linha=()

# Lista Menu Inicial
MenuInicial() {
    echo -e "\033[0;32mreceita - Criar lista de reagentes.\033[0m"
    echo -e "\033[0;32mexit    - Sair da aplicação.\033[0m"
}

# Lista Menu de Receitas
MenuReceitas() {
        
    read -p "Informe o Código da receita: " cod_receita 
    vcod_receita+=("$cod_receita")
    
    linha=$(grep -wi "$cod_receita" basedados.csv)
    
    if [[ -z $linha ]]; then
        echo "Frasco não encontrado... Informe novamente"
        return
    fi
    
    read -p "Informe o Número de unidades para esta receita: " nx_receita
    vnx_receita+=("$nx_receita")
    
    read -p "Fazer outras receitas s/n?" mais_receita
    echo ""
}

# Lista de Receitas Selecionadas
obter_nome_receita() {
    id_receita=$1
    grep -i "^$id_receita," basedados.csv | cut -d',' -f2
}

# Título
echo "Calculadora de consumíveis Goblin Machine!"
echo "v$version"

# Menu Inicial
while true; do

    MenuInicial
    read -p "Digite uma das opções acima: " menu_inicial
    
    if [[ $menu_inicial == "receita" ]]; then

        echo " "
        cat lista.txt
        echo " "

        # Menu de Receitas                   
        while true; do
            
            MenuReceitas
                
            if [[ $mais_receita == "s" ]]; then

                continue
                    
            elif [[ $mais_receita == "n" ]]; then

                echo "Receitas selecionadas:"
                    
                for id in "${vcod_receita[@]}"; do
                    nome_receita=$(obter_nome_receita "$id")
                    echo "$nome_receita"
                done

                echo ""

                # Lista de Resultados
                echo "Calculando reagentes necessários..."
                                    
                break

            else

                echo "Opção inválida... "

            fi

        done
       
    elif [[ $menu_inicial == "exit" ]]; then
        
        echo "Saindo ..."
        break
        
    else
        
        echo "Opção desconhecida, escolha novamente uma das abaixo:"

    fi

done

exit