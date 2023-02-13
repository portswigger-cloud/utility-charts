# utility-charts
Useful charts for useful things.

## Why?

We've all been there... you've installed that $shinyNew-operator, Karpenter, or other Helm chart that requires extra configuration
custom resources.

Sometimes you're lucky and you can make use of `extraObjects` or `extraDeploy` values, maybe you use the `incubator/raw` chart or
create some `./local/chart` to deploy the resources...

This collection of charts might help you with that.

## Conventions

Each chart has an `extraDeploy` value which is templated and can be used to create extra resources in a single Helm release. For
example, to deploy a `SealedSecret` as part of a `grafana-agent` release.

Charts have sensible, overridable, defaults. They don't expose every single option for customisation.


## Charts

### `grafana-agent-config`

### `karpenter-provisioners`

### `rds-ca-certs`

### `traefik-ingress-basic-auth`
