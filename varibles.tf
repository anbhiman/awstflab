variable "aws_region" {
       description = "The AWS region to create things in." 
       default     = "ap-northeast-1" 
}
variable "env" {
       description = "environment will be created here" 
       type = string 
}
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24"]
}
