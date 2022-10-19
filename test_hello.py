from hello import addthis
import pytest


@pytest.fixture
def test_hello():
    assert addthis(1,2) == 3
    
