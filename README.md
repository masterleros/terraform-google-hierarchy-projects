## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| http | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_token | GCP Access Token | `string` | n/a | yes |
| depth | How many sub-folder levels will be included (max: 8) | `number` | `5` | no |
| label\_filter | Filter labels | `object({ key = string, value = string })` | `null` | no |
| parent\_id | Parent ID where projects ID will be get (example: folders/<NUM>; organizations/<NUM>) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| projects | n/a |