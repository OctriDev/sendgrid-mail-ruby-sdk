# Twilio SendGrid Mail API Ruby SDK

The Twilio SendGrid v3 Mail API allows you to send email at scale over HTTP. The Mail Send endpoint supports many levels of functionality, allowing you to send templates, set categories and custom arguments that can be used to analyze your send, and configure which tracking settings to include such as opens and clicks. You can also group mail sends into batches, allowing you to schedule and cancel sends by their batch IDs.

> Package `octri_send_grid_mail` · Version `1.0.0` · 3 operations

## Installation

```sh
# In the delivered checkout
gem build octri_send_grid_mail.gemspec
gem install octri_send_grid_mail-1.0.0.gem

# After this version is published
gem install octri_send_grid_mail -v 1.0.0
```

## Quickstart

The example calls `CreateMailBatch` (POST `/v3/mail/batch`), a low-friction operation that requires no request arguments.

```ruby
require "octri_send_grid_mail"

config = OctriSendGridMail::ClientConfig.new
config.base_url = "https://api.sendgrid.com"
auth = OctriSendGridMail::ClientAuthConfig.new
auth.bearer = ENV.fetch("API_TOKEN")
config.auth = auth
client = OctriSendGridMail::TwilioSendGridMail.new(config)
result = client.mail_batch.create()
p result
```

## Authentication

Keep credentials outside source control. The quickstart reads them from the environment and the client applies them to every request.

| Scheme | ClientAuthConfig field | Sent as |
| --- | --- | --- |
| SDK Studio bearer token | `bearer` | `Authorization: Bearer <token>` |
| BearerAuth | `bearer_auth` | `Authorization: Bearer …` |

## Client behavior

- Base URL: `https://api.sendgrid.com`.
- Transport: Net::HTTP.
- Timeout: 30,000 ms per attempt.
- Retries: up to 3 attempts for status codes `408`, `425`, `429`, `500`, `502`, `503`, `504`, with 500–8,000 ms backoff.
- Idempotency: disabled.
- Error telemetry is disabled by default, even when a reporting endpoint is baked into the build. Consumers must opt in explicitly.
- Telemetry PII filtering is enabled by default: common credentials and direct identifiers are recursively replaced with `[REDACTED]` before reports are sent. Disable it only through the generated logging config's `filterPii` (or language-native equivalent) for a trusted private sink.

High-level operation methods return the typed response body directly. The low-level request layer returns an `SdkResponse<T>` envelope containing data, status, headers, request ID, latency, and attempt count.

## Errors and response metadata

All failure paths use a small, predictable hierarchy:

| Error | Meaning |
| --- | --- |
| `SdkValidationError` | A request argument failed an OpenAPI constraint before network I/O. |
| `SdkHttpError` | The server returned a non-2xx response. |
| `SdkNetworkError` | DNS, connection, TLS, or socket failure. |
| `SdkTimeoutError` | The configured per-attempt timeout elapsed. |

HTTP errors expose `status_code`, the response body and headers, plus `request_id` when the server supplies one. Preserve the request ID in support logs; it is the fastest way to correlate a failed SDK call with server-side traces.

## Project layout and API discovery

- Operation implementations are grouped under `lib/octri_send_grid_mail/methods/`.
- 6 component models are split by API domain under `lib/octri_send_grid_mail/models/<domain>.rb` or `lib/octri_send_grid_mail/models/<tag path>/models.rb`, loaded by `lib/octri_send_grid_mail/types.rb`.
- Component schemas can choose a nested model folder with `x-octri-sdk-tags: ["Billing/Invoices"]`; the first tag owns the model and `/` creates nesting.
- [`sdk-manifest.json`](sdk-manifest.json) is the language-neutral public API index: operations, request/response modes, model properties, enum values, and generation settings.
- Public barrel/module exports are the compatibility boundary. Import public model names from those exports; internal domain filenames may evolve without changing model names.

## Links

- [Source repository](https://github.com/OctriDev/sendgrid-mail-ruby-sdk)
- [Issue tracker](https://github.com/OctriDev/sendgrid-mail-ruby-sdk/issues)
- [API documentation](https://www.twilio.com/docs/sendgrid)
- [Support](https://support.sendgrid.com/hc/en-us)
- [Terms of service](https://www.twilio.com/legal/tos)
- [MIT](https://code.hq.twilio.com/twilio/sendgrid-oas/blob/main/LICENSE)

<!-- sdk-studio-mock-tests -->
## Local mock-server tests

Generated SDK includes schema-derived, zero-dependency mock server and network
contract suite. Node.js 20+ required. Contract probes use authored response
examples only; schema-synthesized routes remain available to the local server.

`./scripts/mock --port 4010` starts server. `./scripts/test` runs the mock contract suite, then native SDK tests. A zero-authored-example contract run succeeds with an explicit zero-test
summary; mismatches in authored examples still fail.
