QUARTUS = ~/intelFPGA_lite/18.1/quartus/bin/quartus


PROGRAM                   = P
ERASE                     = R
LOCK_SECURITY_BIT         = L
INITIALIZE_BRIDGE_DEVICE  = I
VERIFY                    = V
BLANK-CHECK               = B
ISP_CLAMP                 = C
EXAMINE                   = E
SKIP/BYPASS               = S

#----------------------------------------------------

PROJECT 	= tuto1

USB_BLASTER 	= "DE-SoC [1-1.3]"  	#autodetect to get
DEVICE_NUMBER   = 2     		#Necessary if several chips,
					#use autodetect to check

build:
	$(QUARTUS)_sh --flow compile $(PROJECT)

detect:
	$(QUARTUS)_pgm -a

prog:
	$(QUARTUS)_pgm -c $(USB_BLASTER)  --mode=JTAG \
	--operation="$(PROGRAM);output_files/$(PROJECT).sof@$(DEVICE_NUMBER)"

signaltap:
	$(QUARTUS)_stp --stp_file output_files/stp1.stp --enable
