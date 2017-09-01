SMTP_SETTINGS = {
	address: ENV.fetch("SMTP_ADDRESS", "example.com"), # example: "smtp.sendgrid.net"
  authentication: :plain,
  domain: ENV.fetch("SMTP_DOMAIN", "example.com"), # example: "heroku.com"
  enable_starttls_auto: true,
  password: ENV.fetch("SMTP_PASSWORD", "CHANGEME"),
  port: "587",
  user_name: ENV.fetch("SMTP_USERNAME", "CHANGEME")
}
