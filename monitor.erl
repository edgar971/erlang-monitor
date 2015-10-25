-module(monitor).
-export([loop/0]).

loop() ->
        process_flag(trap_exit, true),
        receive
	       %Spawn the divisor and monitor it
                new ->
                        io:format("Creating and monitoring process.~n"),
                        register(divisor, spawn_link(fun divisor:loop/0)),
                        loop();
                        
		%When it exits, output error and restart process.
                {'EXIT', From, Reason} ->
                        io:format("The divisor ~p died with reason ~p.", [From, Reason]),
                                io:format("Restarting. ~n"),
                        self() ! new,
                        loop()
  end.
