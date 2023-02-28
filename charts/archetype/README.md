# archetype

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

A Helm "mono-chart" for deploying common application patterns

## Installation
```
helm repo add utility-charts https://portswigger-cloud.github.io/utility-charts/
helm install archetype utility-charts/archetype
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args | list | `[]` |  |
| deployment.annotations | object | `{}` |  |
| deployment.create | bool | `true` |  |
| deployment.kind | string | `"Deployment"` |  |
| deployment.labels | object | `{}` |  |
| env | object | `{}` |  |
| envFrom | object | `{}` |  |
| extraDeploy | list | `[]` |  |
| healthcheck.httpGet.path | string | `"/"` |  |
| healthcheck.httpGet.port | string | `"app-port"` |  |
| healthcheck.httpGet.scheme | string | `"HTTP"` |  |
| image.name | string | `""` |  |
| image.tag | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.create | bool | `false` |  |
| ingress.host | string | `""` |  |
| ingress.path | string | `"/"` |  |
| lifecycle | object | `{}` |  |
| pod.annotations | object | `{}` |  |
| pod.automountServiceAccountToken | bool | `false` |  |
| pod.imagePullSecrets | list | `[]` |  |
| pod.labels | object | `{}` |  |
| pod.securityContext.fsGroup | int | `1000` |  |
| pod.securityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| pod.terminationGracePeriodSeconds | int | `5` |  |
| ports.app-port.expose | bool | `true` |  |
| ports.app-port.port | int | `8080` |  |
| ports.app-port.protocol | string | `"TCP"` |  |
| resources.cpu | string | `"100m"` |  |
| resources.limits | object | `{}` |  |
| resources.memory | string | `"64Mi"` |  |
| resources.requests | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| service.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |