{{/*
Return the name of the application
*/}}
{{- define "daily-quote-go.name" -}}
{{- .Values.app.name | default .Chart.Name -}}
{{- end -}}

{{/*
Return the chart version.
*/}}
{{- define "mongodb.chart" -}}
{{- printf "%s-%s" .Values.app.chart .Chart.Version -}}
{{- end -}}

{{/*
Return the Serviceaccount name.
*/}}
{{- define "mongodb.serviceAccountName" -}}
{{- default  .Values.serviceAccount.name  -}}
{{- end -}}