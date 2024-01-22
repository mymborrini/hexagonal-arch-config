{{/*
Expand the name of the chart.
*/}}
{{- define "db.name" -}}
{{- default .Chart.Name .Values.db.name | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Values.db.name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "db.labels" -}}
helm.sh/chart: {{ include "db.chart" . }}
{{ include "db.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "db.serviceName"}}
{{- default .Values.db.name "service" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "db.configMapName"}}
{{- default .Chart.Name .Values.db.name "env" | trunc 63 | trimSuffix "-" }}
{{- end }}