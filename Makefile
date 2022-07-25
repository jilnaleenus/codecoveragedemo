TARGET1					:= Test

CC						:= g++
CPC						:= g++

COV_FLAGS               := -fPIC -fprofile-arcs -ftest-coverage
CFLAGS                  := -c -g -Wall
LDFLAGS                 := -g -Wall

INCLUDES                := \
						-I"$(abspath ./libCommon/inc)" \
						-I"$(abspath ./libA/inc)" \
						-I"$(abspath ./libB/inc)"					

EXT_LIBS_PATHS			:= \
						-L$(abspath ./libA)
EXT_LIBS_NAMES			:= \
						-lA
EXT_LIBS1				:= \
						$(abspath ./libA/libA.a)

SRC_DIR                 := $(abspath ./)
SRCS1                   := Test.cpp

OBJ_DIR                 := $(abspath ./obj)
OBJS1                   := $(patsubst %.cpp, $(OBJ_DIR)/%.o, $(SRCS1))

.PHONY: all build_repo build_libs libCommon libA libB clean

all: | build_repo build_libs $(TARGET1)

$(TARGET1): $(OBJS1)
	$(CPC) -L$(abspath ./libB) $(LDFLAGS) $(COV_FLAGS) -o $@ $(OBJS1) $(EXT_LIBS1) -lB

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CPC) $(CFLAGS) $(COV_FLAGS) $(INCLUDES) $< -o $@

build_libs: | libCommon libA libB
	
libCommon:
	cd ./libCommon && $(MAKE)
libA:
	cd ./libA && $(MAKE)
libB:
	cd ./libB && $(MAKE)

build_repo:
	mkdir -p ./obj

gcov: ## Run code coverage
	gcov -o $(OBJ_DIR) *.cpp ./libA/*.cpp ./libB/*.cpp ./libCommon/*.cpp
	#gcov -a -b -c -d -f -o $(OBJ_DIR) *.cpp ./libA/*.cpp ./libB/*.cpp ./libCommon/*.cpp

coverage:
	lcov --capture --directory . --output-file coverage.info
	#lcov --capture --rc lcov_branch_coverage=1 --directory . --output-file coverage.info	

report: coverage ## Generate report
	genhtml -s coverage.info --output-directory target/out_$$(date +%Y%m%d%H%M%S)
	#genhtml --branch-coverage -s coverage.info --output-directory target/out_$$(date +%Y%m%d%H%M%S)	
			
clean:
	rm -rf ./obj
	rm -rf *.a

	cd ./libCommon && $(MAKE) clean
	cd ./libA && $(MAKE) clean
	cd ./libB && $(MAKE) clean

	rm -rf Test
	rm -rf ./coverage.info
	rm -rf out_*
	rm -rf target/*
	rm -rf *.gcov	
