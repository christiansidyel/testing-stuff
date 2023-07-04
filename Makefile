SHELL = /bin/bash


UNAME_S=$(shell uname -s)

bench:
        bash ./benchmarks/run.sh $(BENCHMARK_NAME) $(AGENT_TYPE) $(BENCH)
