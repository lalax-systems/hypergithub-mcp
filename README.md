# HyperGitHub MCP Server

Un servidor MCP (Model Context Protocol) mejorado para GitHub con herramientas extendidas y capacidades avanzadas, incluyendo la capacidad de eliminar repositorios y otras funcionalidades exclusivas.

## 🚀 Características principales

### Mejoras sobre el servidor MCP GitHub original:
- **Herramienta `delete_repository`**: Permite eliminar repositorios de GitHub directamente desde herramientas MCP
- **Rendimiento optimizado**: Mejoras en caché y manejo de solicitudes
- **Manejo de errores mejorado**: Mensajes de error más descriptivos y útiles
- **Compatibilidad completa**: Mantiene todas las herramientas del servidor oficial de GitHub

### Herramientas disponibles:
- Gestión completa de repositorios (crear, listar, eliminar)
- Gestión de issues y pull requests
- Búsqueda avanzada en código, issues y usuarios
- Operaciones de archivos y commits
- Gestión de releases y tags
- Y muchas más...

## 📦 Instalación

### Método 1: Desde fuente
```bash
git clone https://github.com/lalax-systems/hypergithub-mcp.git
cd hypergithub-mcp
go build -o hypergithub ./cmd/github-mcp-server
```

### Método 2: Configuración en Kilo Code / Claude Desktop
```json
{
  "hypergithub": {
    "command": "/ruta/a/hypergithub",
    "args": [],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "tu_token_github"
    }
  }
}
```

## 🔧 Uso

El servidor proporciona todas las herramientas del servidor oficial de GitHub más herramientas exclusivas:

### Ejemplo: Eliminar un repositorio
```bash
# Usando curl con la API MCP
curl -X POST http://localhost:8080/tools/delete_repository \
  -H "Content-Type: application/json" \
  -d '{"owner": "usuario", "repo": "repositorio"}'
```

### Ejemplo: Crear un repositorio
```bash
# Usando las herramientas MCP directamente
mcp hypergithub create_repository --name "mi-repo" --description "Descripción" --private false
```

## 🛠️ Desarrollo

### Requisitos:
- Go 1.24 o superior
- Token de GitHub con permisos adecuados

### Compilación:
```bash
go mod download
go build -o hypergithub ./cmd/github-mcp-server
```

### Ejecución:
```bash
GITHUB_PERSONAL_ACCESS_TOKEN=tu_token ./hypergithub
```

## 📁 Estructura del proyecto
```
hypergithub-mcp/
├── cmd/              # Punto de entrada principal
├── internal/         # Código interno del servidor
├── docs/             # Documentación
├── e2e/              # Pruebas end-to-end
├── script/           # Scripts de utilidad
└── third-party/      # Dependencias de terceros
```

## 🤝 Contribución

Las contribuciones son bienvenidas. Por favor, lee [CONTRIBUTING.md](CONTRIBUTING.md) para más detalles.

## 📄 Licencia

Este proyecto está licenciado bajo la licencia MIT - ver [LICENSE](LICENSE) para más detalles.

## ⭐ Demostración

Este servidor ha sido probado y demostrado con:
- Creación y eliminación de repositorios
- Gestión completa de issues y PRs
- Integración con múltiples clientes MCP
- Rendimiento superior al servidor original

---

**Nota**: Este es un spin-off mejorado del servidor MCP GitHub oficial (`github/github-mcp-server`) con funcionalidades extendidas y optimizaciones.