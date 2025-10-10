# 环境配置指南

## 项目概述

这是一个 AI 演示文稿项目，包含两个主要部分：
- **Vue PPT** (`vue_ppt/`): 基于 Vue 3 + Vite + TypeScript + Tailwind CSS 的演示文稿前端
- **Python 工具** (`python/`): 用于生成 PPT 纹理和素材的 Python 脚本

## 环境要求

### Node.js 环境
- **Node.js**: ^20.19.0 || >=22.12.0 (当前系统: v24.9.0 ✅)
- **npm**: 11.6.0 ✅

### Python 环境
- **Python**: 3.12.11 ✅
- **uv**: 0.9.0 ✅ (已安装)

## 快速启动

### 1. Vue PPT 项目

```bash
cd vue_ppt
npm install          # 安装依赖
npm run dev         # 启动开发服务器
```

访问 `http://localhost:5173` 查看演示文稿。

### 2. Python 纹理生成

```bash
cd python
.venv/bin/python generate_textures.py  # 生成纹理
open texture_preview.html              # 预览纹理
```

## 环境配置详情

### Vue PPT 依赖
- **核心框架**: Vue 3.5.18, Vue Router 4.5.1
- **状态管理**: Pinia 3.0.3
- **3D 渲染**: Three.js 0.180.0
- **构建工具**: Vite 7.0.6
- **样式**: Tailwind CSS 3.4.14
- **类型检查**: TypeScript 5.8.0

### Python 依赖
- **图像处理**: Pillow 11.3.0
- **数值计算**: NumPy 2.3.3
- **包管理**: uv 0.9.0

## 项目结构

```
presentations_by_ai/
├── vue_ppt/                    # Vue 演示文稿前端
│   ├── src/
│   │   ├── presentations/     # 演示文稿页面
│   │   │   ├── ai-skill-tree/ # AI 技能树演示
│   │   │   ├── demo/          # 示例演示
│   │   │   └── ...
│   │   ├── shared/            # 共享组件
│   │   └── ...
│   └── package.json
├── python/                    # Python 工具脚本
│   ├── generate_textures.py   # 纹理生成脚本
│   ├── textures/              # 生成的纹理文件
│   └── .venv/                 # Python 虚拟环境
└── docs/                      # 文档和教程
```

## 开发工作流

### 创建新的演示文稿
1. 在 `vue_ppt/src/presentations/` 下创建新目录
2. 参考 `ai-skill-tree` 的结构创建页面组件
3. 在 `router/index.ts` 中添加路由配置

### 生成自定义纹理
1. 修改 `python/generate_textures.py` 中的 `TextureSpec` 配置
2. 运行脚本生成新的纹理文件
3. 在 Vue 项目中使用生成的纹理

## 故障排除

### Node.js 相关问题
- 确保 Node.js 版本符合要求
- 删除 `node_modules` 和 `package-lock.json` 后重新安装

### Python 相关问题
- 确保 uv 已正确安装并在 PATH 中
- 虚拟环境路径: `python/.venv/`

### 端口冲突
- Vue 开发服务器默认使用 5173 端口
- 如遇冲突，Vite 会自动选择下一个可用端口

## 下一步

- 查看 `docs/` 目录下的详细教程
- 参考 `vue_ppt/src/presentations/ai-skill-tree/` 了解最佳实践
- 使用 `python/generate_textures.py` 创建自定义素材
