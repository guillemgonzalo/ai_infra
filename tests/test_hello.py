from src.hello import hello_world


def test_hello_world_returns_greeting():
    assert hello_world() == "Hello from ai-infra!"
