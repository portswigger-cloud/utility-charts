# grafana-agent-resources

![Version: 0.0.1-alpha.4](https://img.shields.io/badge/Version-0.0.1--alpha.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

A Helm chart for creating PodLogs and PodMonitors for releases that don't support them in their own chart.

## Installation
```
helm repo add utility-charts https://portswigger-cloud.github.io/utility-charts/
helm install grafana-agent-resources utility-charts/grafana-agent-resources
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| pods | object | `{}` |  |

---
