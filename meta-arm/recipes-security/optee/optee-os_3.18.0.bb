require optee-os.inc

DEPENDS += "dtc-native"

SRCREV = "1ee647035939e073a2e8dddb727c0f019cc035f1"
SRC_URI:append = " \
    file://0001-core-Define-section-attributes-for-clang.patch \
   "