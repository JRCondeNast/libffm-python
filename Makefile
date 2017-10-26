CXX = g++
#CXXFLAGS = -Wall -O3 -std=c++0x -march=native -g -O0 
CXXFLAGS = -Wall -O3 -std=c++0x -march=native

# comment the following flags if you do not want to SSE instructions
DFLAG += -DUSESSE

# comment the following flags if you do not want to use OpenMP
# DFLAG += -DUSEOMP
# CXXFLAGS += -fopenmp

all: ffm-train ffm-predict
so: libffm.so

ffm-train: ffm-train.cpp ffm.o timer.o
	$(CXX) $(CXXFLAGS) $(DFLAG) -o $@ $^

ffm-predict: ffm-predict.cpp ffm.o timer.o
	$(CXX) $(CXXFLAGS) $(DFLAG) -o $@ $^

ffm.o: ffm.cpp ffm.h timer.o
	$(CXX) $(CXXFLAGS) $(DFLAG) -c -o $@ $<

libffm.so: ffm.cpp ffm.h timer.o
	$(CXX) -shared $(CXXFLAGS) $(DFLAG) -o $@ -fPIC timer.o $<

timer.o: timer.cpp timer.h
	$(CXX) $(CXXFLAGS) $(DFLAG) -fPIC -c -o $@ $<


clean:
	rm -f ffm-train ffm-predict ffm.o timer.o libffm.so
