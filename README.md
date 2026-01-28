# HyperGitHub MCP Server

![GitHub Release](https://img.shields.io/github/v/release/lalax-systems/hypergithub-mcp?style=for-the-badge)
![Go Version](https://img.shields.io/github/go-mod/go-version/lalax-systems/hypergithub-mcp?style=for-the-badge)
![License](https://img.shields.io/github/license/lalax-systems/hypergithub-mcp?style=for-the-badge)
![GitHub Topics](https://img.shields.io/github/topics/mcp?style=for-the-badge)
![GitHub Topics](https://img.shields.io/github/topics/github?style=for-the-badge)

Un servidor MCP (Model Context Protocol) mejorado para GitHub con herramientas extendidas y capacidades avanzadas, incluyendo la capacidad de eliminar repositorios y otras funcionalidades exclusivas.

## 🚀 Características principales

### 🆚 Mejoras sobre el servidor MCP GitHub original:
- **🔧 Herramienta `delete_repository`**: Permite eliminar repositorios de GitHub directamente desde herramientas MCP
- **⚡ Rendimiento optimizado**: Mejoras en caché y manejo de solicitudes
- **🛡️ Manejo de errores mejorado**: Mensajes de error más descriptivos y útiles
- **🔌 Compatibilidad completa**: Mantiene todas las herramientas del servidor oficial de GitHub

### 🛠️ Herramientas disponibles:
- **📁 Gestión completa de repositorios** (crear, listar, eliminar)
- **📝 Gestión de issues y pull requests**
- **🔍 Búsqueda avanzada** en código, issues y usuarios
- **📄 Operaciones de archivos y commits**
- **🏷️ Gestión de releases y tags**
- **🎯 Y muchas más...**

## 📦 Instalación rápida

### Para Linux (amd64):
```bash
# Descargar binario precompilado
curl -L https://github.com/lalax-systems/hypergithub-mcp/releases/download/v1.0.0/hypergithub-linux-amd64 -o hypergithub
chmod +x hypergithub

# O usar script de instalación
curl -O https://raw.githubusercontent.com/lalax-systems/hypergithub-mcp/main/install.sh
chmod +x install.sh
./install.sh
```

### Desde fuente (cualquier plataforma):
```bash
git clone https://github.com/lalax-systems/hypergithub-mcp.git
cd hypergithub-mcp
go build -o hypergithub ./cmd/github-mcp-server
```

## 🔧 Configuración

### Kilo Code / Claude Desktop:
```json
{
  "hypergithub": {
    "command": "hypergithub",
    "args": ["stdio"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "tu_token_github"
    }
  }
}
```

### VSCode con extensión MCP:
```json
{
  "mcp.servers": {
    "hypergithub": {
      "command": "hypergithub",
      "args": ["stdio"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${env:GITHUB_TOKEN}"
      }
    }
  }
}
```

## 🎯 Uso

### Ejemplo: Eliminar un repositorio
```bash
# El binario se ejecuta automáticamente cuando Kilo Code lo necesita
# No es necesario ejecutarlo manualmente

# Configuración automática:
# 1. Kilo Code ejecuta: hypergithub stdio
# 2. Procesa comandos: delete_repository, create_repository, etc.
# 3. Kilo Code cierra el proceso automáticamente
```

### Herramientas exclusivas de HyperGitHub:
- `delete_repository` - Elimina repositorios de GitHub
- Todas las herramientas del servidor oficial + optimizaciones

## 🛠️ Desarrollo

### Requisitos:
- **Go 1.24 o superior**: [Descargar Go](https://go.dev/dl/)
- **Git**: Para clonar el repositorio
- **Token de GitHub**: Con permisos adecuados

### Compilación:
```bash
go mod download
go build -o hypergithub ./cmd/github-mcp-server
```

### Ejecución de pruebas:
```bash
go test ./...
go vet ./...
go fmt ./...
```

## 📁 Estructura del proyecto
```
hypergithub-mcp/
├── cmd/              # Punto de entrada principal
├── internal/         # Código interno del servidor
├── pkg/              # Paquetes públicos
├── docs/             # Documentación
├── examples/         # Ejemplos de configuración
├── dist/             # Binarios compilados
└── script/           # Scripts de utilidad
```

## 🤝 Contribución

¡Las contribuciones son bienvenidas! Por favor, lee [CONTRIBUTING.md](CONTRIBUTING.md) para más detalles.

### Cómo contribuir:
1. Haz fork del repositorio
2. Crea una rama con un nombre descriptivo
3. Realiza tus cambios
4. Envía un pull request

## 📄 Licencia

Este proyecto está licenciado bajo la licencia MIT - ver [LICENSE](LICENSE) para más detalles.

## 🔗 Enlaces útiles

- [📚 Documentación completa](https://github.com/lalax-systems/hypergithub-mcp/wiki)
- [🐛 Reportar issues](https://github.com/lalax-systems/hypergithub-mcp/issues)
- [💬 Discusiones](https://github.com/lalax-systems/hypergithub-mcp/discussions)
- [📦 Releases](https://github.com/lalax-systems/hypergithub-mcp/releases)
- [🔧 Guía de compilación](COMPILATION.md)
- [📋 Changelog](CHANGELOG.md)

## ⭐ Demostración

Este servidor ha sido probado y demostrado con:
- ✅ Creación y eliminación de repositorios
- ✅ Gestión completa de issues y PRs
- ✅ Integración con múltiples clientes MCP
- ✅ Rendimiento superior al servidor original

---

**Nota**: Este es un spin-off mejorado del servidor MCP GitHub oficial (`github/github-mcp-server`) con funcionalidades extendidas y optimizaciones.

**Keywords**: MCP, Model Context Protocol, GitHub, Automation, Go, Server, CLI, DevTools, API, Integration, AI Assistant, Kilo Code, VSCode, Claude Desktop