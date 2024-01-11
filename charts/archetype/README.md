# archetype

![Version: 0.0.1-alpha.16](https://img.shields.io/badge/Version-0.0.1--alpha.16-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

A Helm "monochart" for deploying common application patterns

## Installation
```
helm repo add utility-charts https://portswigger-cloud.github.io/utility-charts/
helm install archetype utility-charts/archetype
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args | list | `[]` |  |
| ciliumNetworkPolicy.egress | list | `[]` |  |
| ciliumNetworkPolicy.enabled | bool | `false` |  |
| ciliumNetworkPolicy.ingress | list | `[]` |  |
| ciliumNetworkPolicy.ingressControllerEndpointMatchLabels."app.kubernetes.io/name" | string | `"nginx"` |  |
| ciliumNetworkPolicy.ingressControllerEndpointMatchLabels."k8s:io.kubernetes.pod.namespace" | string | `"ingress"` |  |
| cronjobs | object | `{}` |  |
| deployment.annotations | object | `{}` |  |
| deployment.enabled | bool | `true` |  |
| deployment.kind | string | `"Deployment"` |  |
| deployment.labels | object | `{}` |  |
| deployment.replicas | int | `1` |  |
| deployment.updateStrategy.rollingUpdate.maxSurge | string | `"50%"` |  |
| deployment.updateStrategy.rollingUpdate.maxUnavailable | string | `"25%"` |  |
| deployment.updateStrategy.type | string | `"RollingUpdate"` |  |
| env | list | `[]` |  |
| envFrom | list | `[]` |  |
| extraDeploy | list | `[]` |  |
| healthcheck.httpGet.path | string | `"/"` |  |
| healthcheck.httpGet.port | string | `"app-port"` |  |
| healthcheck.httpGet.scheme | string | `"HTTP"` |  |
| image.name | string | `"public.ecr.aws/nginx/nginx"` |  |
| image.tag | string | `"alpine"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `""` |  |
| ingress.paths[0] | string | `"/"` |  |
| initContainers | list | `[]` |  |
| lifecycle | object | `{}` |  |
| networkPolicy.egress | list | `[]` |  |
| networkPolicy.enabled | bool | `true` |  |
| networkPolicy.ingress | list | `[]` |  |
| networkPolicy.ingressControllerNamespaceSelector.matchLabels."kubernetes.io/metadata.name" | string | `"ingress"` |  |
| networkPolicy.ingressControllerPodSelector.matchLabels."app.kubernetes.io/name" | string | `"nginx"` |  |
| pod.additionalVolumeMounts | list | `[]` |  |
| pod.additionalVolumes | list | `[]` |  |
| pod.annotations | object | `{}` |  |
| pod.imagePullSecrets | list | `[]` |  |
| pod.labels | object | `{}` |  |
| pod.securityContext.fsGroup | int | `1000` |  |
| pod.securityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| pod.terminationGracePeriodSeconds | int | `5` |  |
| podDisruptionBudget.enabled | bool | `false` |  |
| podLogs.enabled | bool | `false` |  |
| podMonitor.enabled | bool | `false` |  |
| podMonitor.path | string | `"/prometheus/metrics"` |  |
| podMonitor.port | string | `"app-port"` |  |
| ports.app-port.expose | bool | `true` |  |
| ports.app-port.port | int | `8080` |  |
| ports.app-port.protocol | string | `"TCP"` |  |
| rbac.enabled | bool | `false` |  |
| rbac.kind | string | `"Role"` |  |
| rbac.rules | list | `[]` |  |
| resources.cpu | string | `"100m"` |  |
| resources.limits | object | `{}` |  |
| resources.memory | string | `"64Mi"` |  |
| resources.requests | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| service.enabled | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| serviceAccount.enabled | bool | `true` |  |

---
