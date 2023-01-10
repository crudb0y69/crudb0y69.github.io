---
title: 168.Excel表名称
categories: LeetCode
tags:
 - LeetCode 
 - Easy
sidebar: none
---

> 题目链接：https://leetcode.cn/problems/excel-sheet-column-title/
## 题目描述
给你一个整数 columnNumber ，返回它在 Excel 表中相对应的列名称。映射关系如下：
```text
A -> 1
B -> 2
C -> 3
...
Z -> 26
AA -> 27
AB -> 28 
...
```

## 普通解法
### 解题思路
本质上就是十进制转换成二十六进制，方法就是除基取余。需要注意的是，当十进制数为 `26` 的整数倍时，会出现取余得 `0`，然后 `0 + 64` 取到的字符为 `@`，然后就错了，这里需要做特殊处理，当出现取余得 `0` 的情况，直接将余数设置为 `26`，然后将十进制数减一即可。 

注：A 的 ASCII 码为 65 ， Z 的 ASCII 码为 90，从 1 映射到 A 需要加上 64。
### 代码

```java
class Solution {
    public String convertToTitle(int columnNumber) {
        StringBuilder answer = new StringBuilder();
        char c;
        while (columnNumber > 26) {
            int a = columnNumber % 26;
            if(a == 0) {
                a = 26;
                columnNumber -=1;
            }
            c = (char) (a + 64);
            columnNumber/=26;
            answer.insert(0, c);
        }
        answer.insert(0, (char)(columnNumber + 64));
        return answer.toString();
    }
}
```
### 运行结果
* 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
* 内存消耗：38.9 MB, 在所有 Java 提交中击败了22.01%的用户
