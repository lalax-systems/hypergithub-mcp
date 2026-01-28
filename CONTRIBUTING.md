# Guía de contribución para HyperGitHub MCP

¡Gracias por tu interés en contribuir a HyperGitHub MCP! Este es un proyecto comunitario que mejora el servidor MCP GitHub original con herramientas extendidas.

## Cómo contribuir

### 1. Reportar problemas
- Usa el sistema de issues de GitHub
- Incluye pasos para reproducir el problema
- Especifica tu entorno (SO, versión de Go, etc.)
- Si es posible, incluye ejemplos de código

### 2. Sugerir nuevas características
- Describe la funcionalidad que te gustaría ver
- Explica el caso de uso
- Si es posible, propón una implementación

### 3. Enviar pull requests
1. Haz fork del repositorio
2. Crea una rama con un nombre descriptivo
3. Realiza tus cambios
4. Asegúrate de que las pruebas pasen
5. Envía el pull request

## Estándares de código

### Go
- Sigue las convenciones estándar de Go
- Usa `go fmt` para formatear el código
- Ejecuta `go vet` para verificar problemas
- Mantén la compatibilidad con Go 1.24+

### Commits
- Usa mensajes de commit claros y descriptivos
- Sigue el formato convencional de commits si es posible
- Referencia issues cuando sea apropiado

### Pruebas
- Añade pruebas para nuevas funcionalidades
- Mantén la cobertura de pruebas existente
- Ejecuta `go test ./...` antes de enviar cambios

## Estructura del proyecto

```
hypergithub-mcp/
├── cmd/              # Punto de entrada principal
├── internal/         # Código interno del servidor
│   └── ghmcp/        # Implementación principal
├── docs/             # Documentación
├── e2e/              # Pruebas end-to-end
└── script/           # Scripts de utilidad
```

## Configuración del entorno

1. Clona el repositorio:
   ```bash
   git clone https://github.com/lalax-systems/hypergithub-mcp.git
   cd hypergithub-mcp
   ```

2. Instala dependencias:
   ```bash
   go mod download
   ```

3. Configura tu token de GitHub:
   ```bash
   export GITHUB_PERSONAL_ACCESS_TOKEN=tu_token
   ```

4. Ejecuta el servidor:
   ```bash
   go run ./cmd/github-mcp-server
   ```

## Licencia

Al contribuir, aceptas que tus contribuciones estarán licenciadas bajo la misma licencia MIT que el proyecto.

## Preguntas

Si tienes preguntas sobre cómo contribuir, puedes:
- Abrir un issue de discusión
- Revisar la documentación existente
- Contactar a los mantenedores

¡Gracias por ayudar a mejorar HyperGitHub MCP!