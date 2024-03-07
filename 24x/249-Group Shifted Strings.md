## Leetcode 249

### Group Shifted Strings

#### Solution 1: HashMap

我们每个字符串算出一个 base，作为 Map 的 key。这样所有有相同 base 的 string 都放在 map 中同一个 key 下。

```
class Solution {
    public List<List<String>> groupStrings(String[] strings) {
        List<List<String>> ans = new ArrayList<>();
        Map<String, List<String>> map = new HashMap<>();
        for (String s: strings) {
            String basic = getBasicString(s);
            map.computeIfAbsent(basic, x -> new ArrayList<>()).add(s);
        }
        return new ArrayList<>(map.values());
    }

    private String getBasicString(String s) {
        StringBuilder sb = new StringBuilder();
        int delta = s.charAt(0) - 'a';
        for (char c: s.toCharArray()) {
            char ch = (c - delta >= 'a') ? (char)(c - delta) : (char)(c - delta + 26);
            sb.append(ch);
        }
        return sb.toString();
    }
}
```

Time: O(mn))
Space: O(n)
