# HyperGitHub MCP - Documentation

Welcome to the official documentation of HyperGitHub MCP Server. This documentation is available at [hypergithub-mcp.lalax.com](https://hypergithub-mcp.lalax.com).

## 📖 Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Configuration](#configuration)
4. [Available Tools](#available-tools)
5. [Usage Examples](#usage-examples)
6. [Development](#development)
7. [FAQ](#faq)
8. [Support](#support)

## Introduction

HyperGitHub MCP is an enhanced MCP (Model Context Protocol) server for GitHub. It provides all the functionality of the official GitHub MCP server, plus additional tools and performance optimizations.

### What is MCP?

The Model Context Protocol (MCP) is a standard protocol that allows AI assistants like Kilo Code, Claude Desktop, and others to communicate with external tools in a secure and standardized way.

### Key Features

- **Exclusive `delete_repository` tool**: Allows deleting repositories directly
- **Performance optimized**: Enhanced caching and request handling
- **Full compatibility**: 100% compatible with the official server
- **Open source**: MIT licensed, free to use and modify

## Installation

### Method 1: Precompiled binary (recommended)

```bash
# For Linux (amd64)
curl -L https://github.com/lalax-systems/hypergithub-mcp/releases/download/v1.0.0/hypergithub-linux-amd64 -o hypergithub
chmod +x hypergithub

# For macOS (arm64)
curl -L https://github.com/lalax-systems/hypergithub-mcp/releases/download/v1.0.0/hypergithub-darwin-arm64 -o hypergithub
chmod +x hypergithub
```

### Method 2: Installation script

```bash
curl -O https://raw.githubusercontent.com/lalax-systems/hypergithub-mcp/main/install.sh
chmod +x install.sh
./install.sh
```

### Method 3: Build from source

```bash
git clone https://github.com/lalax-systems/hypergithub-mcp.git
cd hypergithub-mcp
go build -o hypergithub ./cmd/github-mcp-server
```

## Configuration

### Basic configuration for Kilo Code

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

### Configuration for VSCode

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

### Configuration for Claude Desktop

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

## Available Tools

### Repository Management
- `create_repository` - Create a new repository
- `delete_repository` - Delete a repository (HyperGitHub exclusive)
- `list_repositories` - List repositories
- `fork_repository` - Fork a repository

### Issue Management
- `issue_write` - Create or update issues
- `issue_read` - Read issue information
- `list_issues` - List issues
- `search_issues` - Search issues

### Pull Request Management
- `create_pull_request` - Create a pull request
- `pull_request_read` - Read PR information
- `list_pull_requests` - List PRs
- `merge_pull_request` - Merge a PR

### File Operations
- `create_or_update_file` - Create or update files
- `get_file_contents` - Get file contents
- `delete_file` - Delete files
- `push_files` - Push multiple files

### Advanced Search
- `search_code` - Search in code
- `search_repositories` - Search repositories
- `search_users` - Search users
- `search_pull_requests` - Search PRs

### Release Management
- `create_release` - Create a release
- `list_releases` - List releases
- `get_latest_release` - Get the latest release

## Usage Examples

### Example 1: Create and delete a repository

```bash
# The AI assistant will automatically execute:
# 1. create_repository to create "test-repo"
# 2. Perform operations in the repository
# 3. delete_repository to delete it when no longer needed
```

### Example 2: Search code on GitHub

```bash
# Search for all functions named "calculateTotal" in JavaScript repositories
search_code("calculateTotal language:JavaScript")
```

### Example 3: Create an issue with labels

```bash
# Create a bug-type issue with labels
issue_write({
  title: "Error in total calculation",
  body: "The calculateTotal function doesn't sum taxes correctly",
  labels: ["bug", "high-priority"]
})
```

## Development

### Project Structure

```
hypergithub-mcp/
├── cmd/github-mcp-server/     # Main entry point
├── internal/                  # Server internal code
│   ├── ghmcp/                # MCP server implementation
│   └── toolsnaps/            # Tool snapshots
├── pkg/                      # Public packages
├── docs/                     # Documentation
├── examples/                 # Configuration examples
└── script/                   # Utility scripts
```

### Compilation for different platforms

```bash
# Linux (amd64)
GOOS=linux GOARCH=amd64 go build -o hypergithub-linux-amd64 ./cmd/github-mcp-server

# macOS (arm64)
GOOS=darwin GOARCH=arm64 go build -o hypergithub-darwin-arm64 ./cmd/github-mcp-server

# Windows (amd64)
GOOS=windows GOARCH=amd64 go build -o hypergithub-windows-amd64.exe ./cmd/github-mcp-server
```

### Running tests

```bash
# Run all tests
go test ./...

# Run tests with coverage
go test -cover ./...

# Run specific tests
go test ./internal/ghmcp/...
```

## FAQ

### Do I need a GitHub token?
Yes, you need a GitHub personal access token with appropriate permissions. You can create one at [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens).

### Is it compatible with the official GitHub MCP server?
Yes, HyperGitHub MCP is 100% compatible with the official server. All tools from the official server work exactly the same.

### What advantages does it have over the official server?
- Exclusive `delete_repository` tool
- Performance optimizations
- Better error messages
- More maintainable code

### Can I contribute to the project?
Yes! Contributions are welcome. Please read [CONTRIBUTING.md](https://github.com/lalax-systems/hypergithub-mcp/blob/main/CONTRIBUTING.md) for details.

## Support

### Reporting issues
If you find an issue, please:
1. Check the [FAQ](#faq) first
2. Search [existing issues](https://github.com/lalax-systems/hypergithub-mcp/issues)
3. If you don't find a solution, [create a new issue](https://github.com/lalax-systems/hypergithub-mcp/issues/new)

### Discussions
For questions, suggestions, and general discussions, visit [GitHub Discussions](https://github.com/lalax-systems/hypergithub-mcp/discussions).

### Direct contact
- **Email**: info@lalax.com
- **Twitter**: [@lalax_systems](https://twitter.com/lalax_systems)
- **Website**: [lalax.com](https://lalax.com)

---

**Last updated**: January 28, 2026  
**Version**: 1.0.0  
**License**: MIT