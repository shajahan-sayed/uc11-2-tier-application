#creating db subnet group

resource "aws_db_subnet_group" "two_tier_db" {
  name = "two_tier_db"
  subnet_ids = [ 
                aws_subnet.private1.id,
                aws_subnet.private2.id
               ]
  tags = {
    Name = "two_tier_db"
  }
}

resource "aws_db_instance" "db_instance" {
  engine = "MYSQL"
  allocated_storage = 20
  username = var.username
  password = var.password
  instance_class = "db.t3.micro"
  db_name = "testdb"
  publicly_accessible    = false
  db_subnet_group_name = aws_db_subnet_group.two_tier_db.name
  vpc_security_group_ids = [aws_vpc_security.rds_two.id]
  
   # Ensure deletion without final snapshot
  skip_final_snapshot    = true
  deletion_protection    = false
}
