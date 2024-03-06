## Leetcode 791

### Custom Sort String

#### Solution 1: Bucket Sorting

- 先扫一遍 s, bucket 数组记录每个字母出现次数。
- 遍历 order，在 bucket 中找到出现次数，加到结果集中。
- 最后把 order 里没有的全部加到最后。

follow up:

- 提高 efficiency? bucket sort 已经解决了
- 输出所有可能的解？做 DFS 的时候再研究

```
class Solution {
    public String customSortString(String order, String s) {
        int[] bucket = new int[26];
        for (char c: s.toCharArray()) {
            bucket[c - 'a'] ++;
        }

        StringBuilder sb = new StringBuilder();
        for (char c: order.toCharArray()) {
            for (int i = 0; i < bucket[c - 'a']; i ++) {
                sb.append(c);
            }
            bucket[c - 'a'] = 0;
        }

        for (int i = 0; i < 26; i ++) {
            for (int j = 0; j < bucket[i]; j ++) {
                sb.append((char)(i + 'a'));
            }
        }

        return sb.toString();
    }
}
```

Time: O(M + N)
Space: O(1)
