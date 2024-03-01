## Leetcode 346

### Moving Average from Data Stream

#### Solution 1: Queue

用 queue 存不超过 capacity 数量的数据即可。

```
class MovingAverage {

    int size = 0;
    double sum = 0;
    Queue<Integer> q = new LinkedList<>();

    public MovingAverage(int size) {
        this.size = size;
    }

    public double next(int val) {
        if (q.size() == size) {
            sum -= q.poll();
        }
        q.offer(val);
        sum += val;
        return sum/q.size();
    }
}
```

Time: O(1)
Space: O(n) n 为 size
