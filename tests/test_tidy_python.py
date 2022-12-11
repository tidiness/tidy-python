from tidy_python import __version__
from tidy_python.main import main


def test_version():
    assert __version__
    # assert __version__ == "0.1.4" until https://github.com/googleapis/release-please/issues/1773 is fixed


def test_main(capsys):
    main()
    captured = capsys.readouterr()
    assert captured.out == "main code!\n"
