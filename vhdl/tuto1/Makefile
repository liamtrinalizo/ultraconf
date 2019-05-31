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

USB_BLASTER 	= "DE-SoC [2-1.2]"  	#autodetect to get
DEVICE_NUMBER   = 2     		#Necessary if several chips, 
					#use autodetect to check

compile:
	$(QUARTUS)_sh --flow compile $(PROJECT)

autodetect:
	$(QUARTUS)_pgm -a

program:
	$(QUARTUS)_pgm -c $(USB_BLASTER)  --mode=JTAG \
	--operation="$(PROGRAM);output_files/$(PROJECT).sof@$(DEVICE_NUMBER)"
