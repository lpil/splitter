# splitter

Efficiently slice prefixes from strings. Good for parsers!

[![Package Version](https://img.shields.io/hexpm/v/splitter)](https://hex.pm/packages/splitter)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/splitter/)

```sh
gleam add splitter@1
```
```gleam
import splitter

pub fn main() -> Nil {
  let line_ends = splitter.new(["\n", "\r\n"])

  splitter.split(line_ends, "1. Bread\n2. Milk\n")
  // -> #("1. Bread", "\n", "2. Milk")

  splitter.split(line_ends, "No end of line here!")
  // -> #("No end of line here!", "", "")
}
```

Further documentation can be found at <https://hexdocs.pm/splitter>.
