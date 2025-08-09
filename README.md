# ☕ nvim-java Integration Tests

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

Integration tests for nvim-java plugin.

## Running Tests Locally

### Prerequisites

- **Java 21** (Temurin distribution)
- **Neovim 0.12+** (nightly preferred)

### Run tests Manually

```bash
nvim --headless -c "PlenaryBustedDirectory tests { minimal_init = './nvim-config/init.lua' }"
```

### Oveseer.nvim Tasks

- Run `Run nvim-java tests` task


### Environment Variables

Override component branches:
```bash
export NVIM_JAVA_BRANCH="feature-branch"
export NVIM_JAVA_CORE_BRANCH="main"
export LUA_ASYNC_AWAIT_BRANCH="main"
export NVIM_JAVA_REFACTOR_BRANCH="main"
export NVIM_JAVA_DAP_BRANCH="main"
```

## Head on to the main project [☕ nvim-java](https://github.com/nvim-java/nvim-java)
