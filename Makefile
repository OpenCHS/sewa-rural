# <makefile>
# Objects: refdata, package
# Actions: clean, build, deploy
help:
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
	    IFS=$$'#' ; \
	    help_split=($$help_line) ; \
	    help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
	    help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
	    printf "%-30s %s\n" $$help_command $$help_info ; \
	done
# </makefile>


port=8021
server=localhost


## <refdata>
deploy_refdata: ## Creates reference data by POSTing it to the server
	curl -X POST http://$(server):$(port)/catchments -d @catchments.json -H "Content-Type: application/json" 	-H "ORGANISATION-NAME: Sewa Rural"
	curl -X POST http://$(server):$(port)/forms -d @registrationForm.json -H "Content-Type: application/json" -H "ORGANISATION-NAME: Sewa Rural"
	curl -X POST http://$(server):$(port)/operationalModules -d @operationalModules.json -H "Content-Type: application/json" -H "ORGANISATION-NAME: Sewa Rural"
## </refdata>

deploy: deploy_refdata