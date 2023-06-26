CXX      = ghc
CXXFLAGS = 
LDFLAGS  = 

hw1: hw1.hs
	${CXX} ${LDFLAGS} -o out/$@ $^

clean:
	rm -rf *.hi *.o
