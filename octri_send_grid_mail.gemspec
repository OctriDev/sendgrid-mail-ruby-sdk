# frozen_string_literal: true

# HTTP transport: Net::HTTP (net_http, Ruby standard library).

Gem::Specification.new do |spec|
  spec.name          = "octri_send_grid_mail"
  spec.version       = "1.0.0"
  spec.authors       = ["Auto-generated"]
  spec.summary       = "Twilio SendGrid Mail API"
  spec.description = [
    "The Twilio SendGrid v3 Mail API allows you to send email at scale over HTTP. The M",
    "ail Send endpoint supports many levels of functionality, allowing you to send temp",
    "lates, set categories and custom arguments that can be used to analyze your send, ",
    "and configure which tracking settings to include such as opens and clicks. You can",
    " also group mail sends into batches, allowing you to schedule and cancel sends by ",
    "their batch IDs.",
  ].join
  spec.license       = "MIT"
  spec.homepage      = "https://github.com/OctriDev/sendgrid-mail-ruby-sdk"
  spec.metadata      = {
    "source_code_uri" => "https://github.com/OctriDev/sendgrid-mail-ruby-sdk",
    "bug_tracker_uri" => "https://github.com/OctriDev/sendgrid-mail-ruby-sdk/issues",
    "rubygems_mfa_required" => "true",
  }
  spec.required_ruby_version = ">= 3.0"
  spec.files         = Dir["lib/**/*.rb", "test/**/*.rb", "Gemfile", "Rakefile"]
  spec.require_paths = ["lib"]
end
