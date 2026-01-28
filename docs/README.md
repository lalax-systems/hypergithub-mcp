# Documentación de HyperGitHub MCP

Esta carpeta contiene la documentación para GitHub Pages del proyecto HyperGitHub MCP Server.

## Estructura de archivos

- `index.html` - Página principal HTML (temporal)
- `index.md` - Documentación principal en Markdown
- `_config.yml` - Configuración de Jekyll para GitHub Pages
- `CNAME` - Configuración de dominio personalizado

## Configuración de GitHub Pages

GitHub Pages está configurado para:
- **Rama**: `main`
- **Carpeta**: `/docs`
- **Dominio personalizado**: `hypergithub-mcp.lalax.com`
- **Tema**: Cayman (jekyll-theme-cayman)

## Desarrollo local

Para probar la documentación localmente:

```bash
# Instalar Jekyll (requiere Ruby)
gem install bundler jekyll

# Clonar el repositorio
git clone https://github.com/lalax-systems/hypergithub-mcp.git
cd hypergithub-mcp/docs

# Instalar dependencias
bundle install

# Ejecutar servidor local
bundle exec jekyll serve

# Abrir en navegador: http://localhost:4000
```

## Actualización de documentación

1. Editar los archivos Markdown en la carpeta `/docs`
2. Hacer commit y push a la rama `main`
3. GitHub Pages se reconstruirá automáticamente

## Enlaces

- [Sitio de GitHub Pages](https://lalax-systems.github.io/hypergithub-mcp/)
- [Dominio personalizado](http://hypergithub-mcp.lalax.com/)
- [Repositorio GitHub](https://github.com/lalax-systems/hypergithub-mcp)
- [Documentación del tema Cayman](https://github.com/pages-themes/cayman)