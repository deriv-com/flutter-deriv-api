.PHONY: help update_schemas setup

help:
	@echo "update_schemas - Update the schemas"
	@echo "setup - Generate dart code from the schemas"

update_schemas:
	./update_schemas.sh

setup:
	./setup.sh
