variable "tools" {
 default = {

   vault = {
    port        = 8200
    volume_size = 20
     instance_type = "t3.small"
  }

   github-runner = {
     port          = 80
     volume_size   = 20
     instance_type = "t3.small"
   }

 }
}

variable "zone_id" {
 default = "Z09164243MU99FVTOJJQV"
}

variable "domain_name" {
  default = "devopsdvs.online"

}