#creating ec2 
resource "aws_instance" "two_tier_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public1.id
  key_name = var.key_name
  security_groups = [aws_security_group.two_ec2_sg.id]

user_data = <<-EOF
#!/bin/bash
# Update system packages
apt update -y

# Install NGINX
apt install -y nginx

# Start and enable NGINX
systemctl start nginx
systemctl enable nginx

# Create a custom index page
echo "<h1>Hi shajahan your application deployed congr</h1>" | tee /var/www/html/index.html

# Set permissions
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# Restart NGINX
systemctl restart nginx
EOF


 tags = {
   Name = "two_tier_ec2"
 }
}
   
   
  
