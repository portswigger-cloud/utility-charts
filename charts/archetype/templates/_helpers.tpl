{{/* vim: set filetype=mustache: */}}


{{/*
Name to use for everything. The release name. No overrides, no .Chart.Name nonsense.
*/}}
{{- define "archetype.name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "archetype.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Shared labels used for selector*/}}
{{/* This is an immutable field: this should not change between upgrade */}}
{{- define "archetype.labelselector" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Chart.Name }}-{{ template "archetype.name" . }}
{{- end }}


{{/*
Common labels for all resources
*/}}
{{- define "archetype.labels" -}}
{{ include "archetype.labelselector" . }}
app.kubernetes.io/version: {{ .Values.image.tag }}
app.kubernetes.io/part-of: {{ template "archetype.name" . }}
app.kubernetes.io/managed-by: Helm
helm.sh/chart: {{ template "archetype.chart" . }}
{{- end -}}


{{/*
Renders a value that contains template.
Usage:
{{ include "archetype.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "archetype.tplvalues.render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}


{{/*
The name of the service account to use
*/}}
{{- define "archetype.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "archetype.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end -}}
