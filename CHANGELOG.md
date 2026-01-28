# Changelog

Todos los cambios notables en HyperGitHub MCP serán documentados en este archivo.

## [1.0.0] - 2026-01-28

### Características principales
- **Lanzamiento inicial**: Primera versión pública de HyperGitHub MCP
- **Herramienta `delete_repository`**: Capacidad para eliminar repositorios de GitHub
- **Compatibilidad completa**: Mantiene todas las herramientas del servidor MCP GitHub original
- **Mejoras de rendimiento**: Optimizaciones en caché y manejo de solicitudes
- **Manejo de errores mejorado**: Mensajes de error más descriptivos

### Cambios técnicos
- **Refactorización completa**: Código base reorganizado y optimizado
- **Actualización de dependencias**: Go 1.24 y dependencias actualizadas
- **Configuración MCP**: server.json actualizado para HyperGitHub
- **Documentación completa**: README, guías de compilación y contribución

### Binarios precompilados
- Linux (amd64): `hypergithub-linux-amd64`
- Próximamente: macOS (arm64/amd64), Windows (amd64)

### Instalación
```bash
# Descargar binario precompilado
curl -L https://github.com/lalax-systems/hypergithub-mcp/releases/download/v1.0.0/hypergithub-linux-amd64 -o hypergithub
chmod +x hypergithub

# O compilar desde fuente
git clone https://github.com/lalax-systems/hypergithub-mcp.git
cd hypergithub-mcp
go build -o hypergithub ./cmd/github-mcp-server
```

### Configuración
```json
{
  "hypergithub": {
    "command": "./hypergithub",
    "args": ["stdio"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "tu_token"
    }
  }
}
```

### Notas de migración
Esta es la primera versión pública. No hay migración necesaria desde versiones anteriores.

### Próximas características planeadas
- Binarios para macOS y Windows
- Imágenes Docker/OCI preconstruidas
- Integración con marketplace de Kilo Code
- Extensión para VSCode
- Más herramientas extendidas