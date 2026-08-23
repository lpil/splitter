-module(splitter_ffi).
-export([new/1, split/2, split_before/2, split_after/2, would_split/2]).

-spec new(Patterns) -> R when
    Patterns :: [binary()],
    R :: binary:cp().
new([]) ->
    empty_splitter;
new(Patterns) ->
    binary:compile_pattern(Patterns).

-spec split(Splitter,String) -> R when
    Splitter :: empty_splitter | binary:cp(),
    String :: binary(),
    R :: {binary(),binary(),binary()}.
split(empty_splitter, String) ->
    {<<>>, <<>>, String};
split(Splitter, String) ->
    case binary:match(String, Splitter) of
        nomatch -> {String, <<"">>, <<"">>};  % No delimiter found
        {Index, Length} ->
            {binary:part(String, 0, Index),
             binary:part(String, Index, Length),
             binary:part(String, Index + Length, byte_size(String) - Index - Length)}
    end.

-spec split_before(Splitter,String) -> R when
    Splitter :: empty_splitter | binary:cp(),
    String :: binary(),
    R :: {binary(),binary()}.
split_before(empty_splitter, String) ->
    {<<>>, String};
split_before(Splitter, String) ->
    case binary:match(String, Splitter) of
        nomatch -> {String, <<"">>};  % No delimiter found
        {Index, _Length} ->
            {binary:part(String, 0, Index),
             binary:part(String, Index, byte_size(String) - Index)}
    end.

-spec split_after(Splitter,String) -> R when
    Splitter :: empty_splitter | binary:cp(),
    String :: binary(),
    R :: {binary(),binary()}.
split_after(empty_splitter, String) ->
    {<<>>, String};
split_after(Splitter, String) ->
    case binary:match(String, Splitter) of
        nomatch -> {String, <<"">>};  % No delimiter found
        {Index, Length} ->
            SplitPoint = Index + Length,
            {binary:part(String, 0, SplitPoint),
             binary:part(String, SplitPoint, byte_size(String) - SplitPoint)}
    end.

-spec would_split(Splitter,String) -> R when
    Splitter :: empty | binary:cp(),
    String :: binary(),
    R :: {binary(),binary()}.
would_split(empty_splitter, _String) ->
    false;
would_split(Splitter, String) ->
    binary:match(String, Splitter) =/= nomatch.
