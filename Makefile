VPATH=src

HDR=$(wildcard include/*.h)
SRC=src/common.cpp  src/clpeak.cpp  src/options.cpp  src/logger.cpp  src/global_bandwidth.cpp  src/compute_sp.cpp  src/compute_dp.cpp  src/compute_integer.cpp  src/transfer_bandwidth.cpp  src/kernel_latency.cpp  src/entry.cpp


CC := /scratch/android-stc/bin/aarch64-linux-android-g++
CFLAGS := -Wall -O3 -g --std=gnu++11 -fPIC -fopenmp -Wall -fPIE -pie -I/scratch/moskewcz/android/adreno/include -Iinclude -Isrc/kernels -Wno-comment -Wno-deprecated-declarations -Wno-return-type
SYSROOT := /scratch/moskewcz/android/sysroot_msm8996
#SYSROOT := /scratch/moskewcz/android/sysroot_msm8994
LDFLAGS := -fPIE -pie \
	-L${SYSROOT}/system/lib64 -Wl,-rpath-link,${SYSROOT}/system/lib64 \
	-L${SYSROOT}/system/vendor/lib64 -Wl,-rpath-link,${SYSROOT}/system/vendor/lib64 \
	-lOpenCL -lgnustl_shared

clpeak: $(HDR) $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) -o clpeak $(SRC)

clean:
	$(RM) clpeak

.PHONY: clean 
