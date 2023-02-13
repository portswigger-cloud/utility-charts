{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
We need to truncate to 50 characters due to the long names generated for pods
*/}}
{{- define "grafana-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 50 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 26 chars due to the long names generated (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "grafana-agent.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 26 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 26 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 26 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{/*

Return the proper Docker Image Registry Secret Names
*/}}
{{- define "grafana-agent.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.grafanaAgent.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Labels for grafanaAgent
*/}}
{{- define "grafana-agent.grafanaAgent.labels" -}}
{{- include "common.labels.standard" . }}
app.kubernetes.io/component: grafanaAgent
{{- end -}}

{{/*
matchLabels for grafanaAgent
*/}}
{{- define "grafana-agent.grafanaAgent.matchLabels" -}}
{{- include "common.labels.matchLabels" . }}
app.kubernetes.io/component: grafanaAgent
{{- end -}}

{{/*
Return the proper Prometheus Image name
*/}}
{{- define "grafana-agent.grafanaAgent.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.grafanaAgent.image "global" .Values.global) -}}
{{- end -}}
}}

{{/*
Create the name of the grafanaAgent service account to use
*/}}
{{- define "grafana-agent.grafanaAgent.serviceAccountName" -}}
{{- if .Values.grafanaAgent.serviceAccount.create -}}
    {{- default (include "grafana-agent.fullname" .) .Values.grafanaAgent.serviceAccount.name -}}
{{- else -}}
    {{- default "default" .Values.grafanaAgent.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "grafana-agent.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{- printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}
{{- end -}}
