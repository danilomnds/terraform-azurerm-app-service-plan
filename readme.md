# Module - Azure App Service Plan
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the creation of App Service Plan

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.6.4            | 3.80.0          |

## Specifying a version

To avoid that your code get updates automatically, is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can define the version of the module.

Note: The `?ref=***` refers a tag on the git module repo.

## Use case
```hcl
module "plan-<system>-<env>-<id>" {
  source              = "git::https://github.com/danilomnds/terraform-azurerm-app-service-plan?ref=v1.0.0"
  name                = "plan-<system>-<env>-<id>"
  location            = <location>
  resource_group_name = <resource group name>
  kind = <Windows|Linux|FunctionApp>
  sku = {
    tier = <Free|Shared|Basic|Standard|Premium|Isolated>
    size = <B1-B3|S1-S3|...>
    capacity = 1
  }
  tags = {
    key1 = value1
    key2 = value2
  }
  azure_ad_groups = ["group 1 that will have reader access on mysql", "group 2"]
}
output "id" {
  value = module.plan-<system>-<env>-<id>.id
}
output "maximum_number_of_workers" {
  value = module.plan-<system>-<env>-<id>.maximum_number_of_workers
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | plan name | `string` | n/a | `Yes` |
| resource_group_name | the name of the resource group in which the app service plan exists | `string` | n/a | `Yes` |
| location | azure region | `string` | n/a | `Yes` |
| kind | the kind of the app service plan to create | `string` | n/a | `Yes` |
| maximum_elastic_worker_count | the maximum number of total workers allowed for this elasticscaleenabled app service plan | `number` | `null` | No |
| sku | a block as defined below | `object({})` | n/a | No |
| app_service_environment_id | the id of the app service environment where the app service plan should be located | `string` | n/a | No |
| reserved | is this app service plan reserved?  | `bool` | `false` | No |
| is_xenon | whether to create a xenon app service plan | `bool` | n/a | No |
| zone_redundant | specifies if the app service plan should be zone redundant | `bool` | n/a | No |
| tags | tags for the resource | `map(string)` | `{}` | No |
| azure_ad_groups | list of azure AD groups that will have reader access  | `list` | `[]` | No |

# Object variables for blocks

| Variable Name (Block) | Parameter | Description | Type | Default | Required |
|-----------------------|-----------|-------------|------|---------|:--------:|
| sku | tier | specifies the plan's pricing tier | `string` | n/a | `Yes` |
| sku | size | specifies the plan's instance size | `string` | n/a | `Yes` |
| sku | capacity | specifies the number of workers associated with this app service plan | `number` | `null` | No |

  ## Output variables

| Name | Description |
|------|-------------|
| id | app service plan id |
| maximum_number_of_workers | maximum number of workers |

## Documentation
App Service Plan: <br>
[https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan)