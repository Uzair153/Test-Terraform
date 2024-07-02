
resource "aws_vpc" "vpc_test" {
  cidr_block = var.vpc_cidr


  tags = {
    Name = "${var.vpc_tag}"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc_test.id
  tags = {
    Name = "${var.IGW_tag}"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.vpc_test.id
  route {
    cidr_block = var.RT_cidr
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = "${var.RT_tag}"
  }
}

resource "aws_subnet" "subnet_pub_1" {
  vpc_id            = aws_vpc.vpc_test.id
  cidr_block        = var.Pub_subnet_cidr_1
  availability_zone = var.Pub_subnet_AZ_1

  tags = {
    Name = "${var.Pub_subnet_tag_1}"
  }
}
resource "aws_subnet" "subnet_pub_2" {
  vpc_id            = aws_vpc.vpc_test.id
  cidr_block        = var.Pub_subnet_cidr_2
  availability_zone = var.Pub_subnet_AZ_2

  tags = {
    Name = "${var.Pub_subnet_tag_2}"
  }
}


resource "aws_subnet" "subnet_Pri_1" {
  vpc_id            = aws_vpc.vpc_test.id
  cidr_block        = var.Pri_subnet_cidr_1
  availability_zone = var.Pri_subnet_AZ_1
  tags = {
    Name = "${var.Pri_subnet_tag_1}"
  }
}

resource "aws_subnet" "subnet_Pri_2" {
  vpc_id            = aws_vpc.vpc_test.id
  cidr_block        = var.Pri_subnet_cidr_2
  availability_zone = var.Pri_subnet_AZ_2
  tags = {
    Name = "${var.Pri_subnet_tag_2}"
  }
}

resource "aws_route_table_association" "Public_RT_association_1" {
  subnet_id      = aws_subnet.subnet_pub_1.id
  route_table_id = aws_route_table.RT.id
}
resource "aws_route_table_association" "Public_RT_association_2" {
  subnet_id      = aws_subnet.subnet_pub_2.id
  route_table_id = aws_route_table.RT.id
}


output "vpc_id" {
  value = aws_vpc.vpc_test.id
}

output "Pub_subnet_id_1" {
  value = aws_subnet.subnet_pub_1.id
}
output "Pub_subnet_id_2" {
  value = aws_subnet.subnet_pub_2.id
}
