---
title:      '69.x的平方根'
categories: 'LeetCode'
tags:
 - 'LeetCode'
 - 'Easy'
sidebar:    none
mathjax: true
---
 > 题目来源：https://leetcode.cn/problems/sqrtx/
## 题目描述
给你一个非负整数 `x` ，计算并返回 `x` 的算术平方根。

由于返回类型是整数，结果只保留整数部分，小数部分将被舍去。

注意：不允许使用任何内置指数函数和算符，例如 `pow(x, 0.5)` 或者 `x ** 0.5`

## 普通解法
### 思路
此方法为暴力解法，思路就是求每个数的平方于目标值进行比较，由于题目只取整数位，所以当找到第1个数的平方大于 `X` 时，它的前一位数即为所求。

> 注：在循环条件中的 `g*g>0` 目的是为了防止 `int` 数求平方后最高位变为 `1` ，导致求出的平方数为负数。
### 代码

```java
class Solution {
    public int mySqrt(int x) {
        int g = 1;
        while(g*g <= x && g*g > 0){
            g+=1;
        }
        return g - 1;
    }
}
```
### 运行结果
* 执行用时：20 ms, 在所有 Java 提交中击败了10%的用户
* 内存消耗：38.8 MB, 在所有 Java 提交中击败了56%的用户 


## 牛顿迭代法
### 解题思路
此方法使用了牛顿迭代法不断逼近其精确值。

牛顿迭代法的公式为：
$$ g_{n+1} =\frac{1}{2}(g_n+\frac{X}{g_n}) $$
首先取一个猜测值 `g` , `g` 可以取正整数，这里 `g `直接取 `X` 的值，然后判断 `g^2` 是否大于 `X` ，是则根据公式计算出下一个猜测值，直到 `g^2` 小于 `X` ，`g` 即为 `X` 的算数平方根的近似值。

> 注：在 `Math.abs(g*g-x) > 0.1` 中`0.1` 的小数位越长，表示 `g` 越精确，但是不要超过double的精度范围（16位）。由于这里只取整数位，所以只取小数点后一位即可。
### 代码
```java
class Solution {
    public int mySqrt(int x) {
        double g = x;
        while(Math.abs(g*g-x) > 0.1){
            g=(g+x/g)/2;
        }
        return (int)g;
    }
}
```
### 运行结果
* 执行用时：1 ms, 在所有 Java 提交中击败了93.76%的用户
* 内存消耗：39 MB, 在所有 Java 提交中击败了22.00%的用户