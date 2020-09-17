# Check env setup
ifndef OUT_DIR
$(warning ************************************************************)
$(warning * Please invoke "envsetup.sh" with ". envsetup.sh" firstly.)
$(warning * Then call "lunch".)
$(warning ************************************************************)
$(error stopping)
else
$(info TOPDIR: $(TOPDIR))
$(info SRC_DIR: $(SRC_DIR))
$(info OUT_DIR: $(OUT_DIR))
endif

# default target
.PHONY: darget
DEFAULT_GOAL := darget
$(DEFAULT_GOAL): default_targets

.PHONY: default_targets
default_targets:

.PHONY: FORCE
FORCE:
	$(shell mkdir -p $(OUT_DIR))

# may multi-dependency
default_targets: FORCE test

.PHONY: test
test: test.o
	cd $(OUT_DIR); gcc -o $@ $^
%.o: $(SRC_DIR)/%.c
	cd $(OUT_DIR); gcc -c $<

.PHONY: clean
clean:
	@rm -rf $(OUT_DIR)/*
	@echo "Entire build directory removed."
