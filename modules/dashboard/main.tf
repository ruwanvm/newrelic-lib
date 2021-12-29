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
  permissions = "public_read_only"

  dynamic "page" {
    for_each = var.resources
    content {
      name = page.value["tab"]
      dynamic "widget_line" {
        for_each = page.value["title"]
        content {
          row    = (abs(format("%.0f", (widget_line.key / 3))) * 4) + 1
          column = (((widget_line.key % 3) * 4) + 1)
          height = 4
          width  = 4

          title  = upper(page.value["title"][widget_line.key])

          nrql_query {
            query = page.value["query"][widget_line.key]
          }
        }
      }
    }
  }
}