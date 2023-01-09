**A preview of your PR is ready to use.✅**

Huma Platform Play API links:

- [⚕️ Clinician Portal]({{ .url }})
- [📋 API docs]({{ .url }}/apidocs/)
- [㏒ Grafana dashboard with {{ .server_name }} logs]({{ .dashboard_url }})
- [👨‍🔧 QA Helper]({{ .url }}/helper/qa/)
- [💓 back-end health status]({{ .url }}/health/ready)
- [⚙️ back-end version]({{ .url }}/version)

Client information links:

- [📱 iOS QR code]({{ .url }}/api/public/v1beta/region?clientId=c1&type=qrCode)
- [🤖 Android QR code]({{ .url }}/api/public/v1beta/region?clientId=c2&type=qrCode)
- [⚕️ CP]({{ .url }}/api/public/v1beta/region?clientId=c3)

🪣 Your storage bucket URI is `{{ .bucket_uri }}`.
{{ .console_url }}

⛁ You can access your MongoDB database using the following tools:
- Web, [mongo-express]({{ .mongo_express_url }})
  For HTTP basic auth please use:
  - 👨‍💻 username​​:​ `{{ .username }}`
  - 🔑 password: `{{ .password }}`
- *MongoDB Compass* or *MongoDB Shell*, run in a shell `mongosh "{{ .mongo_uri }}"`.
{{ .atlas_warning }}{{ .atlas_cp }}
