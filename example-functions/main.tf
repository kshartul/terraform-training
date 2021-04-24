
output "example1" {

  value = {for s in var.test_list : s => upper(s)}
}

