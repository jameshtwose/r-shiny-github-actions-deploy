materialize-container:
	aws ecr get-login --no-include-email | bash
	docker build -t materialize-container -f Dockerfile .
	docker tag materialize-container 804557026074.dkr.ecr.eu-central-1.amazonaws.com/neuro-shiny
	docker push 804557026074.dkr.ecr.eu-central-1.amazonaws.com/neuro-shiny