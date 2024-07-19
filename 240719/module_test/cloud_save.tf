terraform {
  cloud {
    organization = "SeSAC_org"

    workspaces {
      name = "seondo-space"
    }
  }
}