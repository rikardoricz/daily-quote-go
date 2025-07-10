# Global module

This module creates a resource group

## Usage

```tf
module "resource_group" {
  source   = "../../modules/global"
  name     = "resource-group-name"
  location = "polandcentral"
  tags = {
    "environment" = "dev"
  }
}
```

## Inputs

- `name`
- `location`
- `tags`

## Outputs

- `name` - name of the resource group
- `location` - location (region) of the resource group