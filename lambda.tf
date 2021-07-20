

data "archive_file" "rds_stop" {
  type        = "zip"
  source_file = "RdsStop.py"
  output_path = "outputs/rdsstop.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "outputs/rdsstop.zip"
  function_name = "RdsStop"
  role          =  aws_iam_role.lambda_role.arn
  handler       = "RdsStop.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
 ## source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.7"
}