install:
		pip install --upgrade pip \
				&& pip install -r requirements.txt
				
test:
		python -m pytest -vv --cov=hello --cov=hellocli test_hello

lint:
		pylint --disable=R,C hello.py hellocli.py
		
all: install lint test		