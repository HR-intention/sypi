resource "aws_lambda_function" "sypi" {
  filename = "../out/lambda_sypi.zip"
  source_code_hash = filebase64sha256("../out/lambda_sypi.zip")
  function_name = "sypi"
  role = aws_iam_role.sypi.arn
  handler = "lambda_function.lambda_handler"
  memory_size = "256"
  publish = false
  timeout = "180"
  runtime = "python3.9"
  architectures = ["arm64"]

  environment {
    variables = {
      "sypi_CONF_REGION" = var.region
      "ENV_SECRET_ID" = aws_secretsmanager_secret.env.arn
      "AUTH_SECRET_ID" = aws_secretsmanager_secret.auth.arn
      "BUCKET" = var.package_bucket
      "BUCKET_REGION" = var.region
      "DYNAMO_REGION" = var.region
    }
  }

  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_permission" "sypi" {
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sypi.arn
  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.sypi.execution_arn}/*/${aws_apigatewayv2_stage.default.name}"
}
