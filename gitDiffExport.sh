#!/bin/bash
echo "输出差异的部份, 结束为空白，则预设是当前最新Commit"

read -p "开始Commit ID: " input1
read -p "结束Commit ID: " input2

commitIdStart="${input1:0:10}"
if [ "${input2}" == "" ]; then
	commitIdEnd=$(git rev-parse HEAD);
  commitIdEnd="${commitIdEnd:0:10}"
else
	commitIdEnd="${input2:0:10}"
fi

ptouch() {
  for p do
    _dir="$(dirname -- "$p")"
    mkdir -p -- "$_dir" &&
    touch -- "$p"
  done
}

pcopy() {
  _dir="$(dirname -- "$2")"
  mkdir -p -- "$_dir" 
  cp -rf $1 $2
}



echo "起点: $commitIdStart"
echo "结束: $commitIdEnd"

#建立输出目录
#now=$(date +%Y%m%d_%H%M%S)
now="${commitIdStart}_${commitIdEnd}"
#echo "Current date: $now"
dirpath="GitExport/$now"
echo "输出路径:$dirpath"
mkdir -p $dirpath
#把样版复制到 dirpath
cp -rf output_template/* $dirpath
# 把当前的最新version 写到 patch.sh，方便在程式确认当前的最新commit
echo $commitIdEnd > "$dirpath/version.txt"
#Get File List
files=$(git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRT $commitIdStart $commitIdEnd);
# echo $files;

for item in $files ; do
  echo "复制: ../$item"
  pcopy  "../$item" "$dirpath/files/$item"
done
# Get File Delete List
files=$(git diff-tree -r --no-commit-id --name-only --diff-filter=D $commitIdStart $commitIdEnd);
#echo $files;
# for item in $files ; do
#     echo "写入要删除的档案: $item"
#     echo ../../$item >> "$dirpath/delete_file_list.txt"
# done 
# 打包 
cd $dirpath
tar -cvf "../../${now}.tar" .
# 删除备份档
cd ../../
rm -rf $dirpath
read -p "按下回车离开"



