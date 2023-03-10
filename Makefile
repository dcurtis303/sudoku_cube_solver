CXX = g++
CXXFLAGS = -g -Wall -Wextra -Wpedantic -Wno-deprecated
LIBS =

BIN = solver
BUILDDIR = ./build

SOURCES = $(wildcard src/*.cpp)
OBJECTS = $(SOURCES:%.cpp=$(BUILDDIR)/%.o)
DEPENDS = $(OBJECTS:%.o=%.d)

$(BIN): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

-include $(DEPENDS)

$(BUILDDIR)/%.o : %.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -MMD -c $< -o $@

clean:
	-rm -f $(BIN)
	-rm -rf $(BUILDDIR)
