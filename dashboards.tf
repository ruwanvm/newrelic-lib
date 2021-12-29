module "resource-utilization" {
  source         = "./modules/dashboard"
  dashboard_name = "Resource Utilization"
  resources = [{
    tab = "This Week"
    title = ["title_1", "title_2", "title_3", "title_4", "title_5", "title_6"]
    query = [
      "FROM Transaction SELECT rate(count(*), 1 minute)",
      "FROM Transaction SELECT average(duration) FACET appName",
      "FROM Transaction SELECT average(duration) FACET appName",
      "FROM Transaction SELECT average(duration) FACET appName",
      "FROM Transaction SELECT average(duration) FACET appName",
      "FROM Transaction SELECT rate(count(*), 1 minute)"
    ]
  }]
}