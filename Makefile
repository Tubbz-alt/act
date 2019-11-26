src/act.cf: 
	bnfc -m --haskell src/act.cf -o src/haskell
	bnfc -m --latex src/act.cf -o src/latex && cd src/latex && make

build: src/act.cf

test_specs=$(wildcard tests/*/*.act)

test-parse: build $(test_specs:=.parse)

# Just checks parsing
tests/%.parse:
	./src/haskell/TestAct tests/$*