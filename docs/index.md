# HyperGitHub MCP - Documentación

Bienvenido a la documentación oficial de HyperGitHub MCP Server. Esta documentación está disponible en [hypergithub-mcp.lalax.com](https://hypergithub-mcp.lalax.com).

## 📖 Tabla de contenidos

1. [Introducción](#introducción)
2. [Instalación](#instalación)
3. [Configuración](#configuración)
4. [Herramientas disponibles](#herramientas-disponibles)
5. [Ejemplos de uso](#ejemplos-de-uso)
6. [Desarrollo](#desarrollo)
7. [FAQ](#faq)
8. [Soporte](#soporte)

## Introducción

HyperGitHub MCP es un servidor mejorado del protocolo MCP (Model Context Protocol) para GitHub. Proporciona todas las funcionalidades del servidor oficial de GitHub MCP, más herramientas adicionales y optimizaciones de rendimiento.

### ¿Qué es MCP?

El Model Context Protocol (MCP) es un protocolo estándar que permite a los asistentes de IA como Kilo Code, Claude Desktop y otros comunicarse con herramientas externas de forma segura y estandarizada.

### Características principales

- **Herramienta `delete_repository` exclusiva**: Permite eliminar repositorios directamente
- **Rendimiento optimizado**: Mejoras en caché y manejo de solicitudes
- **Compatibilidad completa**: 100% compatible con el servidor oficial
- **Código abierto**: Licencia MIT, libre para usar y modificar

## Instalación

### Método 1: Binario precompilado (recomendado)

```bash
# Para Linux (amd64)
curl -L https://github.com/lalax-systems/hypergithub-mcp/releases/download/v1.0.0/hypergithub-linux-amd64 -o hypergithub
chmod +x hypergithub

# Para macOS (arm64)
curl -L https://github.com/lalax-systems/hypergithub-mcp/releases/download/v1.0.0/hypergithub-darwin-arm64 -o hypergithub
chmod +x hypergithub
```

### Método 2: Script de instalación

```bash
curl -O https://raw.githubusercontent.com/lalax-systems/hypergithub-mcp/main/install.sh
chmod +x install.sh
./install.sh
```

### Método 3: Compilar desde fuente

```bash
git clone https://github.com/lalax-systems/hypergithub-mcp.git
cd hypergithub-mcp
go build -o hypergithub ./cmd/github-mcp-server
```

## Configuración

### Configuración básica para Kilo Code

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

### Configuración para VSCode

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

### Configuración para Claude Desktop

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

## Herramientas disponibles

### Gestión de repositorios
- `create_repository` - Crear un nuevo repositorio
- `delete_repository` - Eliminar un repositorio (exclusivo de HyperGitHub)
- `list_repositories` - Listar repositorios
- `fork_repository` - Hacer fork de un repositorio

### Gestión de issues
- `issue_write` - Crear o actualizar issues
- `issue_read` - Leer información de issues
- `list_issues` - Listar issues
- `search_issues` - Buscar issues

### Gestión de pull requests
- `create_pull_request` - Crear un pull request
- `pull_request_read` - Leer información de PRs
- `list_pull_requests` - Listar PRs
- `merge_pull_request` - Fusionar un PR

### Operaciones de archivos
- `create_or_update_file` - Crear o actualizar archivos
- `get_file_contents` - Obtener contenido de archivos
- `delete_file` - Eliminar archivos
- `push_files` - Subir múltiples archivos

### Búsqueda avanzada
- `search_code` - Buscar en código
- `search_repositories` - Buscar repositorios
- `search_users` - Buscar usuarios
- `search_pull_requests` - Buscar PRs

### Gestión de releases
- `create_release` - Crear un release
- `list_releases` - Listar releases
- `get_latest_release` - Obtener el último release

## Ejemplos de uso

### Ejemplo 1: Crear y eliminar un repositorio

```bash
# El asistente de IA ejecutará automáticamente:
# 1. create_repository para crear "repo-de-prueba"
# 2. Realizar operaciones en el repositorio
# 3. delete_repository para eliminarlo cuando ya no sea necesario
```

### Ejemplo 2: Buscar código en GitHub

```bash
# Buscar todas las funciones llamadas "calculateTotal" en repositorios de JavaScript
search_code("calculateTotal language:JavaScript")
```

### Ejemplo 3: Crear un issue con etiquetas

```bash
# Crear un issue de tipo bug con etiquetas
issue_write({
  title: "Error en cálculo de totales",
  body: "La función calculateTotal no suma correctamente los impuestos",
  labels: ["bug", "high-priority"]
})
```

## Desarrollo

### Estructura del proyecto

```
hypergithub-mcp/
├── cmd/github-mcp-server/     # Punto de entrada principal
├── internal/                  # Código interno del servidor
│   ├── ghmcp/                # Implementación del servidor MCP
│   └── toolsnaps/            # Snapshots de herramientas
├── pkg/                      # Paquetes públicos
├── docs/                     # Documentación
├── examples/                 # Ejemplos de configuración
└── script/                   # Scripts de utilidad
```

### Compilación para diferentes plataformas

```bash
# Linux (amd64)
GOOS=linux GOARCH=amd64 go build -o hypergithub-linux-amd64 ./cmd/github-mcp-server

# macOS (arm64)
GOOS=darwin GOARCH=arm64 go build -o hypergithub-darwin-arm64 ./cmd/github-mcp-server

# Windows (amd64)
GOOS=windows GOARCH=amd64 go build -o hypergithub-windows-amd64.exe ./cmd/github-mcp-server
```

### Ejecución de pruebas

```bash
# Ejecutar todas las pruebas
go test ./...

# Ejecutar pruebas con cobertura
go test -cover ./...

# Ejecutar pruebas específicas
go test ./internal/ghmcp/...
```

## FAQ

### ¿Necesito un token de GitHub?
Sí, necesitas un token de acceso personal de GitHub con los permisos adecuados. Puedes crear uno en [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens).

### ¿Es compatible con el servidor oficial de GitHub MCP?
Sí, HyperGitHub MCP es 100% compatible con el servidor oficial. Todas las herramientas del servidor oficial funcionan exactamente igual.

### ¿Qué ventajas tiene sobre el servidor oficial?
- Herramienta `delete_repository` exclusiva
- Optimizaciones de rendimiento
- Mejores mensajes de error
- Código más mantenible

### ¿Puedo contribuir al proyecto?
¡Sí! Las contribuciones son bienvenidas. Por favor, lee [CONTRIBUTING.md](https://github.com/lalax-systems/hypergithub-mcp/blob/main/CONTRIBUTING.md) para más detalles.

## Soporte

### Reportar problemas
Si encuentras un problema, por favor:
1. Revisa la [FAQ](#faq) primero
2. Busca en [issues existentes](https://github.com/lalax-systems/hypergithub-mcp/issues)
3. Si no encuentras una solución, [crea un nuevo issue](https://github.com/lalax-systems/hypergithub-mcp/issues/new)

### Discusiones
Para preguntas, sugerencias y discusiones generales, visita las [Discusiones de GitHub](https://github.com/lalax-systems/hypergithub-mcp/discussions).

### Contacto directo
- **Email**: info@lalax.com
- **Twitter**: [@lalax_systems](https://twitter.com/lalax_systems)
- **Sitio web**: [lalax.com](https://lalax.com)

---

**Última actualización**: 28 de enero de 2026  
**Versión**: 1.0.0  
**Licencia**: MIT