# HyperGitHub MCP Documentation

This folder contains the GitHub Pages documentation for the HyperGitHub MCP Server project.

## File Structure

- `index.html` - Main HTML page (temporary)
- `index.md` - Main documentation in Markdown
- `_config.yml` - Jekyll configuration for GitHub Pages
- `CNAME` - Custom domain configuration

## GitHub Pages Configuration

GitHub Pages is configured to:
- **Branch**: `main`
- **Folder**: `/docs`
- **Custom domain**: `hypergithub-mcp.lalax.com`
- **Theme**: Cayman (jekyll-theme-cayman)

## Local Development

To test documentation locally:

```bash
# Install Jekyll (requires Ruby)
gem install bundler jekyll

# Clone the repository
git clone https://github.com/lalax-systems/hypergithub-mcp.git
cd hypergithub-mcp/docs

# Install dependencies
bundle install

# Run local server
bundle exec jekyll serve

# Open in browser: http://localhost:4000
```

## Documentation Updates

1. Edit Markdown files in the `/docs` folder
2. Commit and push to the `main` branch
3. GitHub Pages will rebuild automatically

## Links

- [GitHub Pages site](https://lalax-systems.github.io/hypergithub-mcp/)
- [Custom domain](http://hypergithub-mcp.lalax.com/)
- [GitHub Repository](https://github.com/lalax-systems/hypergithub-mcp)
- [Cayman theme documentation](https://github.com/pages-themes/cayman)