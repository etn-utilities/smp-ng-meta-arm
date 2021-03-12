COMPATIBLE_MACHINE_qemuarm64 = "qemuarm64"

TFA_PLATFORM_qemuarm64-secureboot = "qemu"

TFA_SPD_qemuarm64-secureboot = "opteed"

TFA_UBOOT_qemuarm64-secureboot = "1"
TFA_BUILD_TARGET_aarch64_qemuall = "all fip"

TFA_INSTALL_TARGET_qemuarm64-secureboot = "flash.bin"

DEPENDS_append_aarch64_qemuall = " optee-os"

EXTRA_OEMAKE_append_aarch64_qemuall = " \
    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
    BL32_RAM_LOCATION=tdram \
    "

do_compile_append_qemuarm64-secureboot() {
    # Create a secure flash image for booting AArch64 Qemu. See:
    # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/plat/qemu.rst
    dd if=${BUILD_DIR}/bl1.bin of=${BUILD_DIR}/flash.bin bs=4096 conv=notrunc
    dd if=${BUILD_DIR}/fip.bin of=${BUILD_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
}
