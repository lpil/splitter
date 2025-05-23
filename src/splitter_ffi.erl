-module(splitter_ffi).
-export([new/1, split/2]).

new([]) ->
    empty_splitter;
new(Patterns) ->
    binary:compile_pattern(Patterns).

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
