# 如何配置
- CMake Path in nvim-dap.lua
- 安装LLVM使用Clangd
- pip install cmake-language-server 安装cmake lsp
- ripgrep
- lua-language-server 安装lua lsp
- gdb 14+

# TODO

- [ ] DAP (gdb) 适配Windows （唉Windows Magic）

# 快捷键

    快捷键配置在那里？

    keymaps.lua
    aerial.lua
    bufferline.lua
    hop.lua
    symbols-outline.lua
    telescope.lua
    toggleterm.lua

## 基础

`<leader>` 按键默认为 ` (就是键盘左上角的那个`)

| 键位         | 功能 |
| ----------- | ----------- |
| `<leader>` + `o`      | 打开大纲       |
| `F12`   | 打开另一个大纲        | 
| 
- `<leader>`键 `
- 打开大纲
- `F12` 打开另一个大纲 `{` `}`在函数之间跳转
- `space` 输入字母 选择光标转移位置
- `Ctrl` + `Insert` 复制；`Shift` + `Insert` 粘贴
- `jk` `kj` 退出插入模式
- 选择模式下 `<` `>` 可行左移右移一个Tab
- `q` 退出neovim
- Normal Mode `+` `-`增选减选
- `F4` 保存 `F6` 修正
- `gh` 去句首 
- `gl` 句末 
- `gm`句中
- `zz` 至于中央 `w` word `e` end `b` back


## 窗口操作
- `Alt` + Up Down Left Right 调整窗口大小
- `Alt` + `h` `j` `k` `l` 切换窗口焦点

