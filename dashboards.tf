module "resource-utilization" {
  source         = "./modules/dashboard"
  dashboard_name = "Resource Utilization"
  widget_name    = "Transaction Count"
  widget_title   = "Transaction Count"
  nrql_query     = "FROM Transaction SELECT rate(count(*), 1 minute)"
}