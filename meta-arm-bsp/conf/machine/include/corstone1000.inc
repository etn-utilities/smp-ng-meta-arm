require conf/machine/include/arm/armv8a/tune-cortexa35.inc

MACHINEOVERRIDES =. "corstone1000:"

# Linux kernel
PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
PREFERRED_VERSION_linux-yocto = "5.10%"
KERNEL_IMAGETYPE = "Image"

INITRAMFS_IMAGE_BUNDLE ?= "1"

#telling the build system which image is responsible of the generation of the initramfs rootfs
INITRAMFS_IMAGE = "corstone1000-initramfs-image"

# enable this feature for kernel debugging
# MACHINE_FEATURES += "corstone1000_kernel_debug"

# login terminal serial port settings
SERIAL_CONSOLES ?= "115200;ttyAMA0"

# making sure EXTRA_IMAGEDEPENDS will be used while creating the image
WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"

WKS_FILE ?= "corstone1000-image.corstone1000.wks"