
## Export existing AWS resources to Terraform style (tf, tfstate)

- https://github.com/dtan4/terraforming
- https://github.com/mattaitchison/terraform-provider-convox

## Steps

- Create the initial Rack with `terraform apply`
- Import the Rack into Convox


## Install missing packages?

```
$ go get github.com/hashicorp/errwrap
$ go get github.com/hashicorp/go-multierror
$ go get github.com/hashicorp/go-version
$ go get github.com/hashicorp/hil
$ go get github.com/mitchellh/copystructure
$ go get github.com/hashicorp/go-getter
$ go get github.com/apparentlymart/go-cidr/cidr
$ go get github.com/hashicorp/go-uuid
$ go get github.com/mitchellh/hashstructure
```
