表：Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id 是这个表的主键。
 

编写一个 SQL 查询，查找所有至少连续出现三次的数字。

返回的结果表中的数据可以按 任意顺序 排列。

 

查询结果格式如下面的例子所示：

 

Logs 表：
+----+-----+
| Id | Num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+

Result 表：
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
1 是唯一连续出现至少三次的数字。


-- 自连接
-- 将自连接的结果思考考虑为一颗树，从左到右分别为 叶子---> 根
select
    distinct a.Num as ConsecutiveNums
from
    Logs as a cross join
    Logs as b cross join
    Logs as c
where
    a.Id = b.Id -1
    and b.Id = c.Id - 1
    and a.Num = b.Num
    and b.Num = c.Num;