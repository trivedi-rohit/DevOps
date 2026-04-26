#dynamoDB
resource "aws_dynamodb_table" "remote-dynamodb-table" {
  count = var.dynamoDB_table_count
  name           = "${var.env}-${var.dynamoDB_table_name}-${count.index +1}"
  billing_mode   = "PAY_PER_REQUEST"   # by default companies put billing as provisioned , so change it as "PAY_PER_REQUEST"
  #read_capacity  = 20
  #write_capacity = 20
  hash_key       = "LockID"     
  #range_key      = "GameTitle"

  attribute {
    name = "LockID"     #This attriubute become hash_key. (V.Imp.)
    type = "S"
  }

  tags = {
  Environment = var.env
}
}

