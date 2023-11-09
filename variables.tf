variable "company" {
  description = "Company name"
  type        = string
}

locals {
  trail_name = lower("${var.company}-cloudtrail-full-watcher")
}
