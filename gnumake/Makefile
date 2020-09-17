.PHONY: all
all:

showcur:
	cd /home
	pwd

showhome:
	cd /home; pwd

fathervar = "father"
export fathervar
submodule:
	# cd subdir && $(MAKE)
	$(MAKE) -C subdir

dollar:
	echo $
	echo $$

A := a
B := b
ab := "vars"
multivar:
	echo $($(A)$(B))

nullstring :=
space := $(nullstring)

# override <variable> = <value>

globalvar := "global"
local: globalvar := "local"
local:
	echo $(globalvar)

local2:
	echo $(globalvar)

ifvar :=
ifdef ifvar
ifvar += "defined"
else
ifvar := "not defined"
endif
condition:
	echo $(ifvar)

funcvar := "hello Makefile"
func:
	echo $(subst l,L,$(funcvar))

ERR = $(error finds an error!!)
WAN = $(warning finds an warning!!)
err:
	$(ERR)
	@echo "err done"