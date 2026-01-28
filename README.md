# HyperGitHub MCP Server

![GitHub Release](https://img.shields.io/github/v/release/lalax-systems/hypergithub-mcp?style=for-the-badge)
![Go Version](https://img.shields.io/github/go-mod/go-version/lalax-systems/hypergithub-mcp?style=for-the-badge)
![License](https://img.shields.io/github/license/lalax-systems/hypergithub-mcp?style=for-the-badge)
![GitHub Topics](https://img.shields.io/github/topics/mcp?style=for-the-badge)
![GitHub Topics](https://img.shields.io/github/topics/github?style=for-the-badge)

An enhanced MCP (Model Context Protocol) server for GitHub with extended tools and advanced capabilities, including repository deletion and other exclusive features.

## 🚀 Key Features

### 🆚 Improvements over the official GitHub MCP server:
- **🔧 `delete_repository` tool**: Allows deleting GitHub repositories directly from MCP tools
- **⚡ Performance optimized**: Enhanced caching and request handling
- **🛡️ Improved error handling**: More descriptive and helpful error messages
- **🔌 Full compatibility**: Maintains all tools from the official GitHub server

### 🛠️ Available tools:
- **📁 Complete repository management** (create, list, delete)
- **📝 Issue and pull request management**
- **🔍 Advanced search** in code, issues, and users
- **📄 File and commit operations**
- **🏷️ Release and tag management**
- **🎯 And many more...**

## 📦 Quick Installation

### For Linux (amd64):
```bash
# Download precompiled binary
curl -L https://github.com/lalax-systems/hypergithub-mcp/releases/download/v1.0.0/hypergithub-linux-amd64 -o hypergithub
chmod +x hypergithub

# Or use installation script
curl -O https://raw.githubusercontent.com/lalax-systems/hypergithub-mcp/main/install.sh
chmod +x install.sh
./install.sh
```

### From source (any platform):
```bash
git clone https://github.com/lalax-systems/hypergithub-mcp.git
cd hypergithub-mcp
go build -o hypergithub ./cmd/github-mcp-server
```

## 🔧 Configuration

### Kilo Code / Claude Desktop:
```json
{
  "hypergithub": {
    "command": "hypergithub",
    "args": ["stdio"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token"
    }
  }
}
```

### VSCode with MCP extension:
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

## 🎯 Usage

### Example: Delete a repository
```bash
# The binary runs automatically when Kilo Code needs it
# No manual execution required

# Automatic configuration:
# 1. Kilo Code executes: hypergithub stdio
# 2. Processes commands: delete_repository, create_repository, etc.
# 3. Kilo Code automatically closes the process
```

### HyperGitHub exclusive tools:
- `delete_repository` - Delete GitHub repositories
- All official server tools + optimizations

## 🛠️ Development

### Requirements:
- **Go 1.24 or higher**: [Download Go](https://go.dev/dl/)
- **Git**: For cloning the repository
- **GitHub token**: With appropriate permissions

### Compilation:
```bash
go mod download
go build -o hypergithub ./cmd/github-mcp-server
```

### Running tests:
```bash
go test ./...
go vet ./...
go fmt ./...
```

## 📁 Project Structure
```
hypergithub-mcp/
├── cmd/              # Main entry point
├── internal/         # Server internal code
├── pkg/              # Public packages
├── docs/             # Documentation
├── examples/         # Configuration examples
├── dist/             # Compiled binaries
└── script/           # Utility scripts
```

## 🤝 Contribution

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details.

### How to contribute:
1. Fork the repository
2. Create a descriptive branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) for details.

## 🔗 Useful Links

- [📚 Complete documentation](https://github.com/lalax-systems/hypergithub-mcp/wiki)
- [🐛 Report issues](https://github.com/lalax-systems/hypergithub-mcp/issues)
- [💬 Discussions](https://github.com/lalax-systems/hypergithub-mcp/discussions)
- [📦 Releases](https://github.com/lalax-systems/hypergithub-mcp/releases)
- [🔧 Build guide](COMPILATION.md)
- [📋 Changelog](CHANGELOG.md)

## ⭐ Demonstration

This server has been tested and demonstrated with:
- ✅ Repository creation and deletion
- ✅ Complete issue and PR management
- ✅ Integration with multiple MCP clients
- ✅ Performance superior to the original server

---

**Note**: This is an enhanced spin-off of the official GitHub MCP server (`github/github-mcp-server`) with extended functionality and optimizations.

**Keywords**: MCP, Model Context Protocol, GitHub, Automation, Go, Server, CLI, DevTools, API, Integration, AI Assistant, Kilo Code, VSCode, Claude Desktop