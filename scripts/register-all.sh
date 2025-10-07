#!/bin/bash

# Get the absolute path to the MCP servers directory
MCP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "➡️ Registering all MCP servers with Claude Code..."
echo "📂 MCP Directory: $MCP_DIR"
echo ""

# Register each server in user config (--scope user)
echo "1/8 Registering MySQL server..."
claude mcp add mysql "$MCP_DIR/MySQL/start-mcp.sh" --scope user

echo "2/8 Registering Jira server..."
claude mcp add jira "$MCP_DIR/Jira/start-mcp.sh" --scope user

echo "3/8 Registering GitHub server..."
claude mcp add github "$MCP_DIR/GitHub/start-mcp.sh" --scope user

echo "4/8 Registering CodeReview server..."
claude mcp add code-review "$MCP_DIR/CodeReview/start-mcp.sh" --scope user

echo "5/8 Registering Atlassian server..."
claude mcp add atlassian "$MCP_DIR/Atlassian/start-mcp.sh" --scope user

echo "6/8 Registering CloudWatch server..."
claude mcp add cloudwatch "$MCP_DIR/CloudWatch/start-mcp.sh" --scope user

echo "7/8 Registering AzureAD server..."
claude mcp add azuread "$MCP_DIR/AzureAD/start-mcp.sh" --scope user

echo "8/8 Registering Kafdrop server..."
claude mcp add kafdrop "$MCP_DIR/Kafdrop/start-mcp.sh" --scope user

echo ""
echo "✅ All servers registered!"
echo ""
echo "📋 Verify with: claude mcp list"
echo ""
echo "⚠️  Note: Some servers may show as 'Failed to connect' until you:"
echo "   - Configure .env files (MySQL, Jira, CloudWatch, AzureAD)"
echo "   - Authenticate CLIs (GitHub: gh auth login, Atlassian: acli auth login)"
