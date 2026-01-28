# Compilación de HyperGitHub MCP

Esta guía explica cómo compilar el servidor HyperGitHub MCP desde el código fuente.

## Requisitos previos

- **Go 1.24 o superior**: [Descargar Go](https://go.dev/dl/)
- **Git**: Para clonar el repositorio
- **Token de GitHub**: Con los permisos necesarios para las operaciones que desees realizar

## Pasos de compilación

### 1. Clonar el repositorio
```bash
git clone https://github.com/lalax-systems/hypergithub-mcp.git
cd hypergithub-mcp
```

### 2. Descargar dependencias
```bash
go mod download
```

### 3. Compilar el servidor
```bash
# Compilar para tu plataforma actual
go build -o hypergithub ./cmd/github-mcp-server

# O compilar para múltiples plataformas
GOOS=linux GOARCH=amd64 go build -o hypergithub-linux-amd64 ./cmd/github-mcp-server
GOOS=darwin GOARCH=arm64 go build -o hypergithub-darwin-arm64 ./cmd/github-mcp-server
GOOS=windows GOARCH=amd64 go build -o hypergithub-windows-amd64.exe ./cmd/github-mcp-server
```

### 4. Verificar la compilación
```bash
./hypergithub --version
```

## Ejecución del servidor

### Método 1: Con variable de entorno
```bash
export GITHUB_PERSONAL_ACCESS_TOKEN=tu_token_github
./hypergithub stdio
```

### Método 2: Con flag (no recomendado por seguridad)
```bash
./hypergithub stdio --personal-access-token=tu_token_github
```

## Estructura del ejecutable

El binario compilado (`hypergithub`) incluye:
- Todas las herramientas MCP de GitHub estándar
- Herramientas extendidas de HyperGitHub (incluyendo `delete_repository`)
- Soporte para múltiples herramientas y conjuntos de herramientas
- Sistema de caché optimizado
- Manejo de errores mejorado

## Solución de problemas

### Error: "GITHUB_PERSONAL_ACCESS_TOKEN not set"
```bash
# Solución: Establecer la variable de entorno
export GITHUB_PERSONAL_ACCESS_TOKEN=tu_token_github
```

### Error: "go: module github.com/lalax-systems/hypergithub-mcp not found"
```bash
# Solución: Asegurarse de estar en el directorio correcto
cd hypergithub-mcp
go mod tidy
```

### Error de dependencias faltantes
```bash
# Solución: Actualizar dependencias
go mod download
go mod verify
```

## Integración con clientes MCP

### Kilo Code / Claude Desktop
```json
{
  "hypergithub": {
    "command": "/ruta/completa/a/hypergithub",
    "args": ["stdio"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "tu_token_github"
    }
  }
}
```

### Otras configuraciones
Consulta el archivo `server.json` para configuraciones adicionales de empaquetado OCI y remoto.

## Desarrollo adicional

Para contribuir al desarrollo:
```bash
# Ejecutar pruebas
go test ./...

# Formatear código
go fmt ./...

# Verificar problemas
go vet ./...
```

El servidor ahora está listo para usar con cualquier cliente MCP compatible.