-module(divisor).
-export([loop/0]).

loop() ->
	%Receive the message 
	receive
		%Catch anything inside the variable Number
		Number ->
			%Divide and output the results 
			io:format("Division Result: ~p ~n", [10 / Number]), loop()			
	end.
