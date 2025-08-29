import gleeunit
import gleeunit/should
import splitter

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn split_0_test() {
  splitter.new(["a", "b"])
  |> splitter.split("111a222")
  |> should.equal(#("111", "a", "222"))
}

pub fn split_1_test() {
  splitter.new(["a", "b"])
  |> splitter.split("111b222")
  |> should.equal(#("111", "b", "222"))
}

pub fn split_2_test() {
  splitter.new(["a", "b"])
  |> splitter.split("111a222b333")
  |> should.equal(#("111", "a", "222b333"))
}

pub fn split_3_test() {
  splitter.new(["a", "b"])
  |> splitter.split("111a222b333")
  |> should.equal(#("111", "a", "222b333"))
}

// Right at the start
pub fn split_4_test() {
  splitter.new(["a", "b"])
  |> splitter.split("a222b333")
  |> should.equal(#("", "a", "222b333"))
}

// One pattern is a substring of the other
pub fn split_5_test() {
  splitter.new(["ab", "a"])
  |> splitter.split("ab11")
  |> should.equal(#("", "ab", "11"))
}

// No patterns
pub fn split_6_test() {
  splitter.new([])
  |> splitter.split("ab11")
  |> should.equal(#("", "", "ab11"))
}

// Empty patterns
pub fn split_7_test() {
  splitter.new(["", "ab", "", "a", ""])
  |> splitter.split("22ab11")
  |> should.equal(#("22", "ab", "11"))
}

pub fn split_in_two_0_test() {
  splitter.new(["a", "b"])
  |> splitter.split_in_two("111a222")
  |> should.equal(#("111", "a222"))
}

pub fn split_in_two_1_test() {
  splitter.new(["a", "b"])
  |> splitter.split_in_two("111b222")
  |> should.equal(#("111", "b222"))
}

pub fn split_in_two_2_test() {
  splitter.new(["a", "b"])
  |> splitter.split_in_two("111a222b333")
  |> should.equal(#("111", "a222b333"))
}

pub fn split_in_two_3_test() {
  splitter.new(["a", "b"])
  |> splitter.split_in_two("111a222b333")
  |> should.equal(#("111", "a222b333"))
}

// Right at the start
pub fn split_in_two_4_test() {
  splitter.new(["a", "b"])
  |> splitter.split_in_two("a222b333")
  |> should.equal(#("", "a222b333"))
}

// One pattern is a substring of the other
pub fn split_in_two_5_test() {
  splitter.new(["ab", "a"])
  |> splitter.split_in_two("ab11")
  |> should.equal(#("", "ab11"))
}

// No patterns
pub fn split_in_two_6_test() {
  splitter.new([])
  |> splitter.split_in_two("ab11")
  |> should.equal(#("", "ab11"))
}

// Empty patterns
pub fn split_in_two_7_test() {
  splitter.new(["", "ab", "", "a", ""])
  |> splitter.split_in_two("22ab11")
  |> should.equal(#("22", "ab11"))
}
