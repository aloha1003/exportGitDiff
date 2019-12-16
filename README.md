# exportGitDiff
汇出Git差异的档案

# 使用方法
## 汇出
1. 把该专案丢到任何一个Git专案目录下
2. 执行 gitDiffExport.sh
3. 该shell会提示输入起点跟终点(为空表示为HEAD)
4. 会产生一个 起点_终点 的 tar 档

## 汇入
1. 解压缩 tar 档
2. 执行 patch.sh

## 检查当前版本

1. 执行完patch.sh的之后，会在专案目录新增一个version.txt，请将这个档案加进专案排除名单
2. 请使用后端语言读取version.txt，内容则为该当前专案的版本





