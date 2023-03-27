{{/* vim: set filetype=mustache: */}}


{{/*
Outputs a pod spec for use in different resources.
*/}}
{{- define "archetype.podTemplate" }}
    metadata:
      annotations:
      {{- with .Values.pod.annotations }}
      {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
      {{- include "archetype.labels" . | nindent 8 }}
      {{- with .Values.pod.labels }}
      {{- toYaml . | nindent 8 }}
      {{- end }}
    spec:
      {{- with .Values.pod.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      serviceAccountName: {{ include "archetype.serviceAccountName" . }}
      terminationGracePeriodSeconds: {{ .Values.pod.terminationGracePeriodSeconds }}
      {{- with .Values.podSecurityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.initContainers }}
      initContainers:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      containers:
      - image: "{{ .Values.image.name }}:{{ .Values.image.tag }}"
        imagePullPolicy: Always
        name: {{ template "archetype.name" . }}
        resources:
          requests:
            memory: {{ default .Values.resources.memory .Values.resources.requests.memory | quote }}
            cpu: {{ default .Values.resources.cpu .Values.resources.requests.cpu | quote }}
          limits:
            memory: {{ default .Values.resources.memory .Values.resources.limits.memory | quote }}
            {{- if .Values.resources.limits.cpu }}
            cpu: {{ .Values.resources.limits.cpu | quote }}
            {{- end }}
        ports:
        {{- range $portName, $portSpec := .Values.ports }}
          - name: {{ $portName }}
            containerPort: {{ $portSpec.port }}
            protocol: {{ $portSpec.protocol }}
        {{- end }}
        startupProbe:
          {{- toYaml .Values.healthcheck | nindent 10 }}
          failureThreshold: 60
          periodSeconds: 5
          timeoutSeconds: 2
        readinessProbe:
          {{- toYaml .Values.healthcheck | nindent 10 }}
          failureThreshold: 1
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 2
        livenessProbe:
          {{- toYaml .Values.healthcheck | nindent 10 }}
          failureThreshold: 3
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 2
        {{- with .Values.deployment.lifecycle }}
        lifecycle:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        securityContext:
          {{- toYaml .Values.securityContext | nindent 10 }}
        {{- with .Values.args }}
        args:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        {{- with .Values.env }}
        env:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        {{- with .Values.envFrom }}
        envFrom:
          {{- toYaml . | nindent 10 }}
        {{- end }}
        volumeMounts:
        - mountPath: /tmp
          name: tmp-volume
      {{- with .Values.pod.affinity }}
      affinity:
        {{- tpl (toYaml .Values.pod.affinity) . | nindent 8 }}
      {{- end }}
      {{- with .Values.pod.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.pod.securityContext }}
      securityContext:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- if .Values.topologySpreadConstraints }}
      topologySpreadConstraints:
        {{- tpl (toYaml .Values.topologySpreadConstraints) . | nindent 8 }}
      {{- end }}
      volumes:
      - name: tmp-volume
        emptyDir: {}
{{- end }}
