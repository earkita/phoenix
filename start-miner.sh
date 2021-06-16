#
# Example shell file for starting ./PhoenixMiner to mine ETH
#

# IMPORTANT: Replace the ETH address with your own ETH wallet address in the -wal option (Rig001 is the name of the rig)

#./PhoenixMiner -pool ssl://eu1.ethermine.org:5555 -pool2 ssl://us1.ethermine.org:5555 -wal 0x6D77A1009C79C398dBF2FE8308e67f8B92ffe314.Rig
export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_SINGLE_ALLOC_PERCENT=100
export GPU_MAX_ALLOC_PERCENT=100

sudo nvidia-smi -pm 1
sudo nvidia-smi -i 0 -pl 220
sudo nvidia-smi -i 1 -pl 82
sudo nvidia-smi -i 2 -pl 82
sudo nvidia-smi -i 3 -pl 82

sudo nvidia-smi -acp UNRESTRICTED

sudo nvidia-smi --id=0 --lock-gpu-clocks=1000,1100
sudo nvidia-smi --id=1 --lock-gpu-clocks=1000,1100
sudo nvidia-smi --id=2 --lock-gpu-clocks=1000,1100
sudo nvidia-smi --id=3 --lock-gpu-clocks=1000,1100

X :1 &
export DISPLAY=:1
nvidia-settings -q fans
nvidia-settings -a [gpu:0]/GPUFanControlState=1
nvidia-settings -a [gpu:1]/GPUFanControlState=1
nvidia-settings -a [gpu:2]/GPUFanControlState=1
nvidia-settings -a [gpu:3]/GPUFanControlState=1
nvidia-settings -a [fan:0]/GPUTargetFanSpeed=95
nvidia-settings -a [fan:1]/GPUTargetFanSpeed=95
nvidia-settings -a [fan:2]/GPUTargetFanSpeed=85
nvidia-settings -a [fan:3]/GPUTargetFanSpeed=85
nvidia-settings -a [fan:4]/GPUTargetFanSpeed=85

nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:1]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:2]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:3]/GpuPowerMizerMode=1

nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffsetAllPerformanceLevels=1200
nvidia-settings -a [gpu:0]/GPUGraphicsClockOffsetAllPerformanceLevels=150
nvidia-settings -a [gpu:1]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2100
nvidia-settings -a [gpu:1]/GPUGraphicsClockOffsetAllPerformanceLevels=150
nvidia-settings -a [gpu:2]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2100
nvidia-settings -a [gpu:2]/GPUGraphicsClockOffsetAllPerformanceLevels=150
nvidia-settings -a [gpu:3]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2100
nvidia-settings -a [gpu:3]/GPUGraphicsClockOffsetAllPerformanceLevels=150

nvidia-settings -q all | egrep -i '(Perf|Power|Freq)'
nvidia-settings -q GpuPowerMizerMode
nvidia-settings -q GPUPerfModes -t

/home/ea/Miner/PhoenixMiner -pool ssl://eu1.ethermine.org:5555 -pool2 ssl://us1.ethermine.org:5555 -wal 0x6D77A1009C79C398dBF2FE8308e67f8B92ffe314.Rig -mode 1 -tt 79 -tstop 89 -coin eth
