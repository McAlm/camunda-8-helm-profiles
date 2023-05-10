
.PHONY: deploy-model
deploy-model:
	kubectl create configmap models --from-file=CamundaProcess.bpmn=$(pathToCamundaProcessBpmnFile) -n $(namespace)
	kubectl apply -f $(root)/include/zbctl-deploy-job.yaml                      -n $(namespace)
	kubectl wait --for=condition=complete job/zbctl-deploy --timeout=300s       -n $(namespace)
	kubectl delete configmap models                                             -n $(namespace)
	kubectl delete -f $(root)/include/zbctl-deploy-job.yaml                     -n $(namespace)

# Simple Inbound Connector Process

.PHONY: set-simple-inbound
set-simple-inbound:
	$(eval pathToCamundaProcessBpmnFile := $(root)/bpmn/simple_inbound_connector.bpmn)

.PHONY: deploy-simple-inbound
deploy-simple-inbound: set-simple-inbound deploy-model

# Simple SendGrid Process

.PHONY: set-simple-sendgrid
set-simple-sendgrid:
	$(eval pathToCamundaProcessBpmnFile := $(root)/bpmn/simple_sendgrid.bpmn)

.PHONY: deploy-simple-sendgrid
deploy-simple-sendgrid: set-simple-sendgrid deploy-model

# Benchmark Process

.PHONY: set-benchmark-process
set-benchmark-process:
	$(eval pathToCamundaProcessBpmnFile := $(root)/bpmn/BenchmarkProcess.bpmn)

.PHONY: deploy-benchmark-process
deploy-benchmark-process: set-benchmark-process deploy-model

# OpenAI ChatGpt Process

.PHONY: set-simple-openai
set-simple-openai:
	$(eval pathToCamundaProcessBpmnFile := $(root)/bpmn/simple_openai.bpmn)

.PHONY: deploy-simple-openai
deploy-simple-openai: set-simple-openai deploy-model
