#!/bin/bash

# For NVIDIA GPUs
if command -v nvidia-smi &> /dev/null; then
    gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
    gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
    echo "󰢮 ${gpu_temp}°C"
# For AMD GPUs
elif command -v radeontop &> /dev/null; then
    gpu_info=$(radeontop -d - -l 1 | grep -o 'gpu [0-9]*%' | head -1)
    echo "󰾲 ${gpu_info}"
# Generic approach using /sys filesystem
else
    echo "󰾲 N/A"
fi
