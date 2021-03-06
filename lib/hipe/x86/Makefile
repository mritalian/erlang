#
# %CopyrightBegin%
# 
# Copyright Ericsson AB 2001-2009. All Rights Reserved.
# 
# The contents of this file are subject to the Erlang Public License,
# Version 1.1, (the "License"); you may not use this file except in
# compliance with the License. You should have received a copy of the
# Erlang Public License along with this software. If not, it can be
# retrieved online at http://www.erlang.org/.
# 
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
# the License for the specific language governing rights and limitations
# under the License.
# 
# %CopyrightEnd%
#

ifndef EBIN
EBIN = ../ebin
endif

ifndef DOCS
DOCS = ../doc
endif

include $(ERL_TOP)/make/target.mk
include $(ERL_TOP)/make/$(TARGET)/otp.mk

# ----------------------------------------------------
# Application version
# ----------------------------------------------------
include ../vsn.mk
VSN=$(HIPE_VSN)

# ----------------------------------------------------
# Release directory specification
# ----------------------------------------------------
RELSYSDIR = $(RELEASE_PATH)/lib/hipe-$(VSN)

# ----------------------------------------------------
# Target Specs
# ----------------------------------------------------
# Please keep this list sorted.
MODULES=hipe_rtl_to_x86 \
	hipe_x86 \
	hipe_x86_assemble \
	hipe_x86_cfg \
	hipe_x86_defuse \
	hipe_x86_encode \
	hipe_x86_frame \
	hipe_x86_liveness \
	hipe_x86_main \
	hipe_x86_postpass \
	hipe_x86_pp \
	hipe_x86_ra \
	hipe_x86_ra_finalise \
	hipe_x86_ra_ls \
	hipe_x86_ra_naive \
	hipe_x86_ra_postconditions \
	hipe_x86_ra_x87_ls \
	hipe_x86_registers \
	hipe_x86_spill_restore \
	hipe_x86_x87

HRL_FILES=hipe_x86.hrl
ERL_FILES=$(MODULES:%=%.erl)
TARGET_FILES=$(MODULES:%=$(EBIN)/%.$(EMULATOR))
DOC_FILES= $(MODULES:%=$(DOCS)/%.html)

# APP_FILE=
# APP_SRC=$(APP_FILE).src
# APP_TARGET=$(EBIN)/$(APP_FILE)
#
# APPUP_FILE=
# APPUP_SRC=$(APPUP_FILE).src
# APPUP_TARGET=$(EBIN)/$(APPUP_FILE)

# ----------------------------------------------------
# FLAGS
# ----------------------------------------------------
ERL_COMPILE_FLAGS += +warn_exported_vars

# ----------------------------------------------------
# Targets
# ----------------------------------------------------

debug opt: $(TARGET_FILES)

docs: $(DOC_FILES)

clean:
	rm -f $(TARGET_FILES)
	rm -f core

$(DOCS)/%.html:%.erl
	erl -noshell -run edoc_run file '"$<"' '[{dir, "$(DOCS)"}]' -s init stop

# ----------------------------------------------------
# Special Build Targets
# ----------------------------------------------------

# ----------------------------------------------------
# Release Target
# ----------------------------------------------------
include $(ERL_TOP)/make/otp_release_targets.mk

release_spec: opt
	$(INSTALL_DIR) $(RELSYSDIR)/ebin
	$(INSTALL_DATA) $(TARGET_FILES) $(RELSYSDIR)/ebin

release_docs_spec:

# Please keep this list sorted.
$(EBIN)/hipe_rtl_to_x86.beam: ../rtl/hipe_rtl.hrl
$(EBIN)/hipe_x86_assemble.beam: ../main/hipe.hrl ../rtl/hipe_literals.hrl ../misc/hipe_sdi.hrl
$(EBIN)/hipe_x86_cfg.beam: ../flow/cfg.hrl ../flow/cfg.inc
$(EBIN)/hipe_x86_frame.beam: ../rtl/hipe_literals.hrl
$(EBIN)/hipe_x86_liveness.beam: ../flow/liveness.inc
$(EBIN)/hipe_x86_main.beam: ../main/hipe.hrl
$(EBIN)/hipe_x86_ra: ../main/hipe.hrl
$(EBIN)/hipe_x86_ra_dummy.beam: ../main/hipe.hrl
$(EBIN)/hipe_x86_ra_ls.beam: ../main/hipe.hrl
$(EBIN)/hipe_x86_ra_postconditions.beam: ../main/hipe.hrl
$(EBIN)/hipe_x86_ra_x87_ls.beam: ../main/hipe.hrl
$(EBIN)/hipe_x86_registers.beam: ../rtl/hipe_literals.hrl
$(EBIN)/hipe_x86_spill_restore.beam: ../main/hipe.hrl ../flow/cfg.hrl
$(EBIN)/hipe_x86_x87.beam: ../main/hipe.hrl

$(TARGET_FILES): hipe_x86.hrl
