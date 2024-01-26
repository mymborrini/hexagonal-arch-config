{{/*
Expand the name of the chart.
*/}}
{{- define "alpha.name" -}}
{{- default .Chart.Name .Values.alpha.name | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "alpha.chart" -}}
{{- printf "%s-%s" .Chart.Name .Values.alpha.name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "alpha.labels" -}}
helm.sh/chart: {{ include "alpha.chart" . }}
{{ include "alpha.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "alpha.selectorLabels" -}}
app.kubernetes.io/name: {{ include "alpha.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "alpha.serviceName"}}
{{- printf "%s-%s" .Values.alpha.name "service" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "alpha.configMapName"}}
{{- printf "%s-%s" .Values.alpha.name "env" | trunc 63 | trimSuffix "-" }}
{{- end }}