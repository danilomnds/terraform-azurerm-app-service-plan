# Module - Azure Service Plan
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the creation of Service Plan

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.6.4            | 3.82.0          |
| v1.1.0         | v1.10.4           | 4.11.0          |

## Specifying a version

To avoid that your code get the latest module version, you can define the `?ref=***` in the URL to point to a specific version.
Note: The `?ref=***` refers a tag on the git module repo.

## Use case
```hcl
module "plan-<system>-<env>-<id>" {
  source              = "git::https://github.com/danilomnds/terraform-azurerm-service-plan?ref=v1.1.0"
  name                = "plan-<system>-<env>-<id>"
  location            = <location>
  os_type = <Windows|Linux|WindowsContainer>
  resource_group_name = <resource group name>
  sku_name = <B1-B3|S1-S3|...>
  tags = {
    key1 = value1
    key2 = value2
  }
  azure_ad_groups = ["group 1 that will have reader access on mysql", "group 2"]
}
output "id" {
  value = module.plan-<system>-<env>-<id>.id
}
output "kind" {
  value = module.plan-<system>-<env>-<id>.kind
}
output "reserved" {
  value = module.plan-<system>-<env>-<id>.reserved
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | plan name | `string` | n/a | `Yes` |
| location | azure region | `string` | n/a | `Yes` |
| os_type | the o/s type for the app services to be hosted in this plan | `string` | n/a | `Yes` |
| resource_group_name | the name of the resource group in which the app service plan exists | `string` | n/a | `Yes` |
| sku_name | the SKU for the plan | `string` | n/a | `Yes` |
| app_service_environment_id | The ID of the App Service Environment where the App Service Plan should be located | `string` | n/a | `Yes` |
| maximum_elastic_worker_count | the maximum number of total workers allowed for this elasticscaleenabled app service plan | `number` | `null` | No |
| worker_count | the number of Workers (instances) to be allocated | `bool` | `false` | No |
| per_site_scaling_enabled | should per site scaling be enabled | `bool` | `false` | No |
| zone_balancing_enabled | should the service plan balance across availability zones in the region | `bool` | `false` | No |
| tags | tags for the resource | `map(string)` | `{}` | No |
| azure_ad_groups | list of azure AD groups that will have reader access  | `list` | `[]` | No |

  ## Output variables

| Name | Description |
|------|-------------|
| id | service plan id |
| kind | maximum number of workers |
| reserved | whether this is a reserved service plan type |

## Documentation
Service Plan: <br>
[https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan)