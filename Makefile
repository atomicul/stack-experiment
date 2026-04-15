OBJECTS := myentrypoint.o

.PHONY: all
all: moved-stack normal

moved-stack: moved-stack.o $(OBJECTS)
	$(CC) -o moved-stack moved-stack.o $(OBJECTS)

normal: normal.o $(OBJECTS)
	$(CC) -o normal normal.o $(OBJECTS)

.PHONY: clean
clean:
	rm -f *.o main normal moved-stack
