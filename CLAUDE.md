# nvim-java Plugin Testing

This repository contains a GitHub Actions workflow to test the nvim-java plugin.

## Workflow Setup

The workflow (`/.github/workflows/test-nvim-java.yml`) includes:

- **Java Setup**: Uses Java 21 (Temurin distribution)
- **Neovim**: Uses nightly version via `rhysd/action-setup-vim`
- **Configuration**: Clones `nvim-java/starter-nvim-0.12.git` as Neovim config
- **Testing Framework**: Uses `plenary.nvim` test harness

## Test Structure

Tests are located in `/tests/` directory:
- `basic_spec.lua`: Basic tests for java module loading and Java executable availability

## Running Tests

Tests run automatically on push/PR to main branch. The workflow:
1. Sets up the environment (Java + Neovim + config)
2. Installs plenary.nvim for testing
3. Runs tests using `plenary.test_harness`