# advanced-testing-techniques
This is a repo for doing a simple example of testing


## Setup Project

1. Create and source virtualenv

```bash
virtualenv ~/.advanced-testing
source ~/.advanced-testing/bin/activate
```

2. Create scaffold
```bash
touch Makefile \
  && touch requirements.txt \
  && touch hello.py \
  && touch test_hello.py
```

3. Populate 'Makefile'
```bash
install:
		pip install --upgrade pip \
				&& pip install -r requirements.txt
				
test:
		python -m pytest -vv --cov=hello --cov=hellocli test_hello

lint:
		pylint --disable=R,C hello.py hellocli.py
		
all: install lint test		
```

4. Populate 'requirements.txt'
```
pylint
pytest
pytest-cov
click
flask
```

### How to debug
 
 * Print
 * pdb
 * Testing

#### Example
1. 'hello.py'
```python
def addthis(x,y):
    # We can use pdb if can't figure out what happens, which is a great tool
    # that allow us to run the code line by line and more 
    import pdb;pdb.set_trace()
    
    # We can use print statements to check variables type and values
    print(f"This is x: {x} and the x-type is {type(x)}")
    print(f"This is y: {y} and the y-type is {type(y)}")
    
    # We can use try-except block to check what happens
    
    try:
        print( f"Correct type and execution")
        result = x + y
    except TypeError:
        print(f"The wrong type passed")
        result = int(x) + int(y)
        
    print(f"This is the result {result}")
    return result

print(addthis("one",2))
```