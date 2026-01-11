#!/bin/bash

# Definição das cores
VERMELHO='\e[0;31m'
VERDE='\e[0;32m'
AZUL='\e[0;34m' 
CINZA='\033[90m'
PADRAO='\e[0m' # Resetar para a cor padrão

# Capturando valores
USO_CPU="$("$HOME/.config/nvim/scripts/cpu_usage.sh")"
USO_RAM=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')
CPU_NAME=$(awk -F': ' '/model name/ {print $2; exit}' /proc/cpuinfo)
RAM_TOTAL=$(awk '/MemTotal/ {printf "%.1f GB\n", $2/1024/1024}' /proc/meminfo)
NVIM_VERSION=$(nvim --version | head -n 1 | awk '{print $2}' | sed 's/^v//')

# Imprimindo com cores
echo -e "${AZUL}Kernel $(uname) $(uname -r)${PADRAO}"
echo -e "${VERMELHO}CPU: ${USO_CPU}%${PADRAO}${CINZA} of ${CPU_NAME}${PADRAO}"
echo -e "${VERMELHO}RAM: ${USO_RAM}%${PADRAO}${CINZA} of ${RAM_TOTAL}${PADRAO}"
echo -e "${VERDE}NeoVim version ${NVIM_VERSION}${PADRAO}"

