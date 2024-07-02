variable "lb_name" {
  type = string

}
variable "listener_port" {
  type = string
}
variable "listener_protocol" {

}
variable "TG_name" {
  type = string

}
variable "TG_protocol" {
  type = string

}
variable "TG_port" {
  type = string

}
variable "lb_subnets" {
  type = list(string)
}
variable "vpc_id" {
  type = string

}