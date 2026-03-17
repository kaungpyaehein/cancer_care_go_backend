# Cancer Care Go Backend

A RESTful API backend for the Cancer Care Flutter application, providing comprehensive cancer information, hospital listings, treatment options, and educational blog content with multi-language support.

## 🚀 Features

- **Multi-language Support**: English and Myanmar (Burmese) language support
- **RESTful API**: Clean, intuitive REST endpoints
- **CORS Enabled**: Ready for Flutter web and mobile clients
- **Comprehensive Data**: Cancer types, hospitals, blogs, and treatment information
- **Easy to Deploy**: Simple setup and deployment process

## 📋 Prerequisites

- **Go 1.21 or higher**: [Download Go](https://golang.org/dl/)
- **Git**: For version control

## 🛠️ Installation & Setup

### 1. Clone or Navigate to the Repository

```bash
cd /Users/kp/Desktop/cancer_care_go_backend
```

### 2. Initialize Go Module

```bash
go mod init cancer_care_go_backend
```

### 3. Install Dependencies

```bash
go get github.com/gin-gonic/gin
go get github.com/gin-contrib/cors
```

### 4. Configure Environment (Optional)

Create a `.env` file in the project root:

```bash
PORT=8080
GIN_MODE=debug
```

## 🏃 Running the Server

### Development Mode

```bash
go run cmd/api/main.go
```

The server will start at `http://localhost:8080`

### Production Build

```bash
# Build the binary
go build -o cancer_care_api cmd/api/main.go

# Run the binary
./cancer_care_api
```

## 📡 API Endpoints

### Health Check
```
GET /api/health
```
Returns server status and version information.

### Get Cancer Types
```
GET /api/cancers?lang={languageCode}
```
- **Query Parameters**: 
  - `lang` (optional): Language code (`en` for English, `mm` for Myanmar). Default: `en`
- **Response**: List of cancer types with descriptions, symptoms, and treatments

### Get Hospitals
```
GET /api/hospitals?lang={languageCode}
```
- **Query Parameters**: 
  - `lang` (optional): Language code (`en` or `mm`). Default: `en`
- **Response**: List of hospitals with contact info, specialties, and ratings

### Get Blogs
```
GET /api/blogs?lang={languageCode}
```
- **Query Parameters**: 
  - `lang` (optional): Language code (`en` or `mm`). Default: `en`
- **Response**: List of blog posts about cancer care and prevention

### Get Treatments
```
GET /api/treatments?lang={languageCode}
```
- **Query Parameters**: 
  - `lang` (optional): Language code (`en` or `mm`). Default: `en`
- **Response**: List of treatment methods with procedures and side effects

## 🧪 Testing the API

### Using cURL

```bash
# Health check
curl http://localhost:8080/api/health

# Get cancers in English
curl http://localhost:8080/api/cancers

# Get cancers in Myanmar
curl http://localhost:8080/api/cancers?lang=mm

# Get hospitals
curl http://localhost:8080/api/hospitals

# Get blogs
curl http://localhost:8080/api/blogs

# Get treatments
curl http://localhost:8080/api/treatments
```

### Using a Browser

Open your browser and navigate to:
- http://localhost:8080/api/health
- http://localhost:8080/api/cancers
- http://localhost:8080/api/hospitals
- http://localhost:8080/api/blogs
- http://localhost:8080/api/treatments

## 📱 Connecting Your Flutter App

Update your Flutter app's API configuration to point to the backend:

```dart
// For local development
const String baseUrl = 'http://localhost:8080/api';

// For production (after deployment)
const String baseUrl = 'https://your-domain.com/api';

// Example API call
Future<List<CancerType>> getCancers(String languageCode) async {
  final response = await http.get(
    Uri.parse('$baseUrl/cancers?lang=$languageCode'),
  );
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return (data['data'] as List)
        .map((json) => CancerType.fromJson(json))
        .toList();
  }
  throw Exception('Failed to load cancers');
}
```

## 📂 Project Structure

```
cancer_care_go_backend/
├── cmd/
│   └── api/
│       └── main.go              # Application entry point
├── internal/
│   ├── models/
│   │   └── models.go            # Data models (CancerType, Hospital, etc.)
│   ├── data/
│   │   ├── mock_data.go         # English language data
│   │   └── mock_data_mm.go      # Myanmar language data
│   ├── handlers/
│   │   └── handlers.go          # HTTP request handlers
│   └── middleware/
│       └── cors.go              # CORS configuration
├── go.mod                        # Go module dependencies
├── go.sum                        # Dependency checksums
└── README.md                     # This file
```

## 🌐 Deployment Options

### Option 1: Deploy to Heroku

1. Install Heroku CLI
2. Create a `Procfile`:
   ```
   web: ./cancer_care_api
   ```
3. Deploy:
   ```bash
   heroku create your-app-name
   git push heroku main
   ```

### Option 2: Deploy to Google Cloud Run

```bash
gcloud run deploy cancer-care-api \
  --source . \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
```

### Option 3: Deploy to Railway

1. Connect your GitHub repository to [Railway](https://railway.app/)
2. Railway will auto-detect Go and deploy

### Option 4: Traditional VPS (DigitalOcean, AWS EC2, etc.)

1. Build the binary: `go build -o cancer_care_api cmd/api/main.go`
2. Upload to your server
3. Run with a process manager like `systemd` or `pm2`

## 🔧 Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Server port | `8080` |
| `GIN_MODE` | Gin mode (debug/release) | `debug` |

## 🐛 Troubleshooting

### Port Already in Use

```bash
# Find process using port 8080
lsof -i :8080

# Kill the process
kill -9 <PID>
```

### Module Import Issues

```bash
# Clean module cache
go clean -modcache

# Reinstall dependencies
go mod tidy
go mod download
```

### CORS Issues with Flutter

Make sure your Flutter app includes proper headers and the backend CORS middleware is configured correctly (already done in this project).

## 📝 Adding Myanmar Translations

To add Myanmar language translations:

1. Edit `internal/data/mock_data_mm.go`
2. Replace the TODO placeholders with actual Myanmar translations
3. Restart the server

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 📞 Support

For questions or issues, please contact the development team.

---

**Made with ❤️ for Cancer Care Awareness**
