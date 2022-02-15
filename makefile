materialize-container:
	aws ecr get-login --no-include-email | bash
	docker build -t materialize-container -f Dockerfile .
	docker tag materialize-container https://public.ecr.aws/u1b0k5h2/neuro-shiny
	docker push https://public.ecr.aws/u1b0k5h2/neuro-shiny