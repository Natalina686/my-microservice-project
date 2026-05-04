variable "use_aurora" {
  description = "Create Aurora cluster or RDS instance"
  type        = bool
  default     = false
}

variable "db_name" {
  type        = string
  default     = "appdb"
}

variable "username" {
  type        = string
}


variable "engine" {
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  type        = string
  default     = "15"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
}

variable "multi_az" {
  type        = bool
  default     = false
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "parameter_group_family" {
  type    = string
  default = "postgres15"
}
