-- 几个朋友来到电影院的售票处，准备预约连续空余座位。

-- 你能利用表cinema，帮他们写一个查询语句，获取所有空余座位，并将它们按照 seat_id 排序后返回吗？

| seat_id | free |
|---------|------|
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |


-- 对于如上样例，你的查询语句应该返回如下结果。



| seat_id |
|---------|
| 3       |
| 4       |
| 5       |
-- 注意：

-- seat_id 字段是一个自增的整数，free 字段是布尔类型（'1' 表示空余， '0' 表示已被占据）。
-- 连续空余座位的定义是大于等于 2 个连续空余的座位。
-- 理解不来
select distinct a.seat_id
from cinema a join cinema b
  on abs(a.seat_id - b.seat_id) = 1
  and a.free = true and b.free = true
order by a.seat_id
;