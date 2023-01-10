---
title:      171.Excel表序号
categories: LeetCode
tags:
 - LeetCode       
 - Easy
sidebar:    none
---

> 题目链接：https://leetcode.cn/problems/excel-sheet-column-number/

## 题目描述
给你一个字符串 columnTitle ，表示 Excel 表格中的列名称。返回 该列名称对应的列序号 。

## 普通解法 
### 解题思路
根据题目的映射关系：
A -> 1
B -> 2
……
Z -> 26
AA -> 27
AB -> 28
……
可知，当只有一个字母时，最大数为 26 ，当有两个字母时，遇到 A 需要进一位,该问题相当于把 26 进制数转换成 10 进制数
可用每位上的字母所映射的数字 × 权重，权重为`基^(所在位数 - 1)`，26进制的基就是26。例如ABED的可按下列方法计算：
$$ A × 26^3 + B × 26^2 + E × 26^1 + D × 26^0 $$
其中，A代表值1，B代表值2，D代表值4，E代表值5，所以上式结果为:
$$ 1× 26^3 + 2×26^2 + 5×26^1 + 4 × 26^0 = 19062$$

### 代码

```java
class Solution {
    public int titleToNumber(String columnTitle) {
       int answer = 0;
        char[] item = columnTitle.toCharArray();
        int len = item.length;
        for (int i = 0; i < len; i++) {
            int c = item[i] - 64;
            int d = (int) Math.pow(26, len-i-1);
            answer += c * d;
        }
        return answer;
    }
}
```
### 运行结果
* 执行用时: 1 ms，在所有 Java 提交中击败了49%的用户
* 内存消耗: 40.5 MB，在所有 Java 提交中击败了22%的用户
