# coc使用前需安装nodo.js Packer 

# #插件

- 更新安装 PackerSync

- 卸载插件 把要卸载的插件注释或者删除掉 PackerClean

# #操作指南

#### 基础

- 保存 `Ctrl + S`

- 退出 `Ctrl + Q`

- 插入模式光标移动 
  
  左 `Ctrl + [` 
  
  右 `Ctrl + ]` 
  
  上 `Ctrl + P` 
  
  下 `Ctrl + N`

- 退出插入模式 `jj`

- `Alt + hjkl`选择窗口

- `s v/h` 分屏

- `s c` 关闭分屏

#### 自动补全cmp

- `Ctrl + j k` 上下移动

- `Ctrl + f b` 滚动描述窗口大小

- `Ctrl + Space` 好像不管用

- `Ctrl + e` 关闭边栏

- 回车确认

- `tab` 比如，确认之后，出现一个方法的模板，填充完名称按Tab跳转到参数，再按跳转到代码块

设置请到 `cmp.lua`

- `formatting` 可调整弹出的窗口 `source` 改变顺序

- `ghosttext` 水印提示

#### LSP

- `:LspInstall` 安装的lsp server

- `Shift + K` 相当于悬停

- `gd` 走到定义
  
- `gD` 走到声明
  
- `gi` 走到实现
  
- `Ctrl + k` 签名帮助(?)
  
- `gr` 引用
  
- `[d` `]d` 前后报错

- `<loader>q` 错误列表(<loader>目前设置为`\`)

- 添加语言支持在 `mason.lua` 的server加，使用 `:Mason` 命令安装，在settings里面添加设置。具体见[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

#### 查找功能

- `<leader>ff` 查找文件
- `<leader>fg` 查找片段
- `<leader>fb` 在打开的文件里面查找
- `<leader>fh` 查找帮助文档
- `<leader>sf`
- `<leader>/` 不知道有啥意义
- lua\user\plugin-config\telescope.lua 自己看罢(

#### 其他

- `gcc`注释

- [文件大纲](https://github.com/simrat39/symbols-outline.nvim)

- 命令模式输入Tab提示

- `Enter`增量选择 `Backspace`减量选择

- 代码格式化 `=` 全部格式化 `ggvG=` or `gg=G`

- 折叠代码 `zc` `zo`

# ------ Coc ------ 

coc分支

- CocList extensions 显示所有插件

- CocUninstall <插件名称>

- CocList marketplace <插件名> 查找插件

- 其余看代码罢（
