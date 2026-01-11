#!/usr/bin/env bash
# Script para calcular uso total de CPU (percent) via /proc/stat
# Saída: número com 1 casa decimal, ex: 12.3

prevfile="/tmp/eww_cpu_prev"

# Ler a linha 'cpu ' do /proc/stat
read -r cpu user nice system idle iowait irq softirq steal guest guest_nice < <(awk '/^cpu /{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}' /proc/stat)

# Somar campos relevantes para total e idle
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle_all=$((idle + iowait))

usage="0.0"

if [ -f "$prevfile" ]; then
  read prev_total prev_idle < "$prevfile"
  totald=$((total - prev_total))
  idled=$((idle_all - prev_idle))
  if [ "$totald" -gt 0 ]; then
    usage=$(awk -v t="$totald" -v i="$idled" 'BEGIN{printf "%.1f", (t - i) / t * 100}')
  fi
fi

# Guardar snapshot atual para a próxima execução
printf "%d %d" "$total" "$idle_all" > "$prevfile"

# Imprimir o uso (eww pega essa saída)
echo "$usage"


