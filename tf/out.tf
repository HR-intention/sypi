output "instance_public_ip" {
  value       = aws_apigatewayv2_stage.default.invoke_url                                          # The actual value to be outputted
  description = "Server Gateway endpoint" # Description of what this output represents
}
