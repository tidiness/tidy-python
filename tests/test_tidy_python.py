from tidy_python import __version__


def test_version():
    assert __version__
    # assert __version__ == "0.1.4" until https://github.com/googleapis/release-please/issues/1773 is fixed
