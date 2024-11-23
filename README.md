# 如何配置
- CMake Path in nvim-dap.lua
- 安装LLVM使用Clangd
- pip install cmake-language-server 安装cmake lsp
- ripgrep
- lua-language-server 安装lua lsp
- gdb 14+

# TODO

- [ ] DAP (gdb) 适配Windows #唉Windows Magic（；´д｀）ゞ
- [ ] 快捷键使用Which Key管理
- [x] todo-comments插件
- [x] CMake run.sh快捷键适配Windows

# 快捷键和使用方法

> 快捷键配置在那里？

- [keymaps.lua](lua/keymaps.lua)
- [aerial.lua](lua/config/aerial.lua)
- [bufferline.lua](lua/config/bufferline.lua)
- [hop.lua](lua/config/hop.lua)
- [telescope.lua](lua/config/telescope.lua)
- [toggleterm.lua](lua/config/toggleterm.lua)

## 基础

> `<leader>` 按键默认为 ` #就是键盘左上角的那个

| 键位                | 功能 *(插件)*            |
| ------------------- | ------------------------ |
| `space` 输入字母    | 选择光标转移位置 *(hop)* |
| `Ctrl` + `Insert`   | 复制                     |
| `Shift` + `Insert`  | 粘贴                     |
| `jk` `kj`           | 退出插入模式             |
| Visual Mode `<` `>` | 可行左移右移一个Tab      |
| `q`                 | 退出neovim               |
| Normal Mode `+` `-` | 增选减选                 |
| `F4`                | 保存                     |
| `gh`                | 去句首                   |
| `gl`                | 句末                     |
| `gm`                | 句中                     |
| `zz`                | 至于中央                 |
| `w`                 | word                     |
| `e`                 | end                      |
| `b`                 | back                     |
| `Insert`            | 压扁模式(Zen Mode)       |





## 窗口操作

| 键位                               | 功能 *(插件)*                   |
| ---------------------------------- | ------------------------------- |
| `Alt` + `Up` `Down` `Left` `Right` | 调整窗口大小                    |
| `Alt` + `h` `j` `k` `l`            | 切换窗口焦点                    |
| `Alt` + `m`                        | 打开文件管理器窗口 *(NvimTree)* |

## Code Action

| 键位          | 功能 *(插件)*                                  |
| ------------- | ---------------------------------------------- |
| `gso` / `F12` | 打开大纲, 使用`{` `}`在函数之间跳转 *(aerial)* |
| `F9`          | 错误列表                                       |
| `g=`/`F16` | 格式化代码 |
| `K` | 查看文档 |
| `gK` | 函数签名 |
| `gw` | 代码修复 |
| `gn` | 重命名变量(修改) |
| `gN` | 重命名变量(重写) |
| `gd` | go definitions 符号定义 |
| `gD` | go declaration 符号声明 |
| `gss` | 开关静态分析错误列表 |
| `gsl`/`F6` | 开关编译器报错 |
| `gsd` | 当前光标下静态分析错误 |
| `gsi` | 开关参数虚文字 *(Inlay Hint)* |
| `gsu` | 重启LSP |
| `gy` | 查找类型定义 |
| `gr` | 查找所以引用 |
| `gY` | 查找函数实现 |
| `gz` | 查看全部 |
| `gst` | 查看类型继承图(派生类) |
| `gsT` | 查看类型继承图(基类) |
| `go`/`gO` | 跳转到头文件 |
| `g`+`Ctrl`+`o` | 跳转到源文件 |
| `Shift` + `Tab` | 打开之前关闭的文件 |

> p.s. [telescope.lua](lua/config/telescope.lua)

## 运行和调试
### CMake *(cmake-tools)*
| 键位         | CMake           | 无CMake                |
| ------------ | --------------- | ---------------------- |
| `F5` / `cmr` | CMakeRun        | `./run.sh`/`./run.bat` |
| `F17`        | CMakeStopRunner | `Ctrl` + `c`           |
| `cmb`        | CMakeBuild      | `make`                 |
| `cmc`        | CMakeGenerate   | `./configure`          |
| `cms`        | CMakeStopRunner | `Ctrl` + `c`           |

## 插件
### 标签栏 *(BufferLine)*
| 键位 | 功能 |
| ---- | ---- |
| `g`+`Tab` | Pin页面 |
| `g`+`Space` | 挑选页面 |
| `Ctrl`+`h`/`l` | 左右选择页面 |
| `g`+`BS` | 删除页面 |
| `g`+`Shift`+`Tab` | 删除其他页面 |

> p.s. 足够了，剩下的看[bufferline.lua](lua/config/bufferline.lua)罢

### 查找 *(Telescope)*
| 键位 | 功能 |
| ---- | ---- |
| `<leader>`+`l` | 查找文件 |
| `<leader>`+`L` | 查找文件（仅包含 CMake 目标所直接包含的源和头文件） |
| `<leader>`+`O` | 查找文件（仅包含 CMakeLists.txt 和 *.cmake 类文件） |
| `<leader>`+`i` | 查找 git 仓库中的文件 |
| `<leader>`+`o` | 查找最近打开过的文件 |
| `<leader>`+`p` | 查找 git status 中的文件 |
| `<leader>`+`k` | 查找当前项目文件中的文字 |
| `<leader>`+`.` | 模糊查找当前文件中的文字 |
| `<leader>`+`b` | 查找所有已打开文件 |
| `<leader>`+`B` | 查找当前 Tab 中所有已打开文件 |
| `<leader>`+`j` | 查找 vim 的跳转记录 |
| `<leader>`+`m` | 查找 vim 的标记 |
| `<leader>`+`/` | 查找 / 的搜索记录 |
| `<leader>`+`:` | 查找 vim 命令历史记录 |
| `<leader>`+`;` | 查找所有 vim 命令 |
| `<leader>`+`?` | 查找帮助文档 |
| `<leader>`+`t` | 查找 todo 等事项(需要todo-comments) |
| `<leader>`+`z` | 查找本文件中所有文本对象 |
| `<leader>`+`x` | 查找本文件中所有符号 |
| `<leader>`+`c` | 查找 git 仓库的 commit 历史 |
| `<leader>`+`v` | 查找 git 仓库的所有分支 |
| `<leader>`+`a` | 查找本文件中所有静态分析报错 |
| `<leader>`+`q` | 查找本文件中所有动态编译报错 |
| `<leader>`+`n` | 查看所有 Vim 通知 |
| `<leader>`+`<leader>` | 模糊查询 |

### ToDo *(TodoComment)*
| 键位 | 功能 |
| ---- | ---- |
| `]t` | 下一个todo comment |
| `[t` | 上一个todo comment |

使用方法:
```
//TODO:
//FIX:
//HACK:
//TEST:
//PERF:
//NOTE:
//WARN:
```

### Git *(Neogit)* 
> #有点鸡肋
| 键位  | 功能       |
| ----- | ---------- |
| `F10` | 打开neogit |

### 终端 *(ToggleTerm*) 
> #有点鸡肋，不如直接打开新的终端窗口
| 键位 | 功能 |
| ---- | ---- |
| `F8` | 打开终端 |

### Markdown预览 *(MarkdownPreview)*
> #有点鸡肋，不如用vscode

使用方法:
```
:MarkdownPreviewToggle
```

