# Testing Techniques
This is a repo for doing a simple example of testing python code


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

1. Print and pdb
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
2. Using 'make test'
```bash
make test
python -m pytest -vv --cov=hello test_hello.py
========================================================================================================================================= test session starts ==========================================================================================================================================
platform linux -- Python 3.7.10, pytest-7.1.3, pluggy-1.0.0 -- /home/ec2-user/.advanced-testing/bin/python
cachedir: .pytest_cache
rootdir: /home/ec2-user/environment/advanced-testing-techniques
plugins: cov-4.0.0
collected 0 items / 1 error                                                                                                                                                                                                                                                                            

================================================================================================================================================ ERRORS ================================================================================================================================================
____________________________________________________________________________________________________________________________________ ERROR collecting test_hello.py ____________________________________________________________________________________________________________________________________
hello.py:7: in addthis
    result = x + y
E   TypeError: can only concatenate str (not "int") to str

During handling of the above exception, another exception occurred:
test_hello.py:1: in <module>
    from hello import addthis
hello.py:15: in <module>
    print(addthis("one",2))
hello.py:10: in addthis
    result = int(x) + int(y)
E   ValueError: invalid literal for int() with base 10: 'one'
------------------------------------------------------------------------------------------------------------------------------------------- Captured stdout --------------------------------------------------------------------------------------------------------------------------------------------
This is x: one and the x-type is <class 'str'>
This is y: 2 and the y-type is <class 'int'>
Correct type and execution
The wrong type passed

---------- coverage: platform linux, python 3.7.10-final-0 -----------
Name       Stmts   Miss  Cover
------------------------------
hello.py      12      2    83%
------------------------------
TOTAL         12      2    83%

======================================================================================================================================= short test summary info ========================================================================================================================================
ERROR test_hello.py - ValueError: invalid literal for int() with base 10: 'one'
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Interrupted: 1 error during collection !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
=========================================================================================================================================== 1 error in 0.12s ===========================================================================================================================================
```
