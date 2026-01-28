#!/bin/bash

# Script de instalación para HyperGitHub MCP
# Descarga el binario precompilado y lo configura para uso con Kilo Code/VSCode

set -e

VERSION="v1.0.0"
INSTALL_DIR="${HOME}/.local/bin"
BINARY_NAME="hypergithub"
REPO_URL="https://github.com/lalax-systems/hypergithub-mcp"

# Detectar sistema operativo y arquitectura
detect_platform() {
    case "$(uname -s)" in
        Linux*)     OS="linux" ;;
        Darwin*)    OS="darwin" ;;
        CYGWIN*|MINGW*|MSYS*) OS="windows" ;;
        *)          OS="unknown" ;;
    esac
    
    case "$(uname -m)" in
        x86_64|amd64) ARCH="amd64" ;;
        arm64|aarch64) ARCH="arm64" ;;
        *) ARCH="unknown" ;;
    esac
    
    echo "${OS}-${ARCH}"
}

PLATFORM=$(detect_platform)

# Verificar plataforma compatible
case "$PLATFORM" in
    linux-amd64)
        echo "✅ Plataforma detectada: Linux (amd64)"
        BINARY_FILE="hypergithub-linux-amd64"
        ;;
    linux-arm64)
        echo "⚠️  Linux ARM64 no tiene binario precompilado aún. Compilando desde fuente..."
        compile_from_source
        exit 0
        ;;
    darwin-amd64|darwin-arm64)
        echo "⚠️  macOS no tiene binario precompilado aún. Por favor compila desde fuente."
        echo "   Visita: $REPO_URL/blob/main/COMPILATION.md"
        exit 1
        ;;
    windows*)
        echo "⚠️  Windows no tiene binario precompilado aún. Por favor compila desde fuente."
        echo "   Visita: $REPO_URL/blob/main/COMPILATION.md"
        exit 1
        ;;
    *)
        echo "❌ Plataforma no soportada: $PLATFORM"
        echo "   Por favor compila desde fuente: $REPO_URL/blob/main/COMPILATION.md"
        exit 1
        ;;
esac

# Crear directorio de instalación si no existe
mkdir -p "$INSTALL_DIR"

# Descargar binario
echo "📥 Descargando HyperGitHub MCP $VERSION..."
DOWNLOAD_URL="$REPO_URL/releases/download/$VERSION/$BINARY_FILE"
curl -L "$DOWNLOAD_URL" -o "$INSTALL_DIR/$BINARY_NAME"

# Hacer ejecutable
chmod +x "$INSTALL_DIR/$BINARY_NAME"

# Verificar instalación
if command -v "$INSTALL_DIR/$BINARY_NAME" >/dev/null 2>&1; then
    echo "✅ HyperGitHub MCP instalado exitosamente en: $INSTALL_DIR/$BINARY_NAME"
    
    # Mostrar información de versión
    echo "📋 Información de versión:"
    "$INSTALL_DIR/$BINARY_NAME" --version || true
    
    # Verificar si ~/.local/bin está en PATH
    if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
        echo ""
        echo "⚠️  Nota: $INSTALL_DIR no está en tu PATH."
        echo "   Añade esto a tu ~/.bashrc o ~/.zshrc:"
        echo "   export PATH=\"\$HOME/.local/bin:\$PATH\""
        echo "   Luego ejecuta: source ~/.bashrc"
    fi
    
    echo ""
    echo "🚀 ¡Instalación completada!"
    echo ""
    echo "📝 Configuración para Kilo Code/VSCode:"
    echo "1. Añade esto a tu mcp_settings.json:"
    cat << 'EOF'
{
  "hypergithub": {
    "command": "hypergithub",
    "args": ["stdio"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "tu_token_github"
    }
  }
}
EOF
    
    echo ""
    echo "2. Reemplaza 'tu_token_github' con tu token real de GitHub"
    echo "3. Reinicia Kilo Code/VSCode"
    echo ""
    echo "❓ Para más información: $REPO_URL"
    
else
    echo "❌ Error: No se pudo verificar la instalación"
    exit 1
fi