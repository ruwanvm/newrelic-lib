terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "2.34.1"
    }
  }
}

provider "newrelic" {}

resource "newrelic_one_dashboard" "dashboard" {
  name = var.dashboard_name

  page {
    name = var.widget_name

    widget_billboard {
      title  = var.widget_title
      row    = 1
      column = 1
      nrql_query {
        query = var.nrql_query
      }
    }
  }
}