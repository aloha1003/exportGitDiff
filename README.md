# exportGitDiff
汇出Git差异的档案
## 执行环境需求

 考虑到跨平台相容性，汇出的档案, 档案格式为unix，会用到 dos2unix 指令，请事先安装好该指令, 可用 
```
	apt-get install -y dos2unix 或 yum install -y dos2unix
```
# 使用方法
## 汇出
1. 把该专案丢到任何一个Git专案目录下
2. 执行 gitDiffExport.sh
3. 该shell会提示输入起点跟终点(为空表示为HEAD)
4. 会产生一个 起点_终点 的 tar 档

## 汇入
1. 解压缩 tar 档
2. 执行 {起点}_{终点}/patch.sh





