{{/*
Return the name of the application
*/}}
{{- define "daily-quote-go.name" -}}
{{- .Values.app.name | default .Chart.Name -}}
{{- end -}}

{{/*
Return the chart version.
*/}}
{{- define "daily-quote-go.chart" -}}
{{- printf "%s-%s" .Values.app.chart .Chart.Version -}}
{{- end -}}