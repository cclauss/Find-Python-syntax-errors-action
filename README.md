## Action that finds Python 3 syntax errors and undefined names 
A GitHub Action that runs selected [flake8](http://flake8.pycqa.org) tests on the Python code in your repo.
If there are ___syntax errors or undefined names___ found in your Python code then this Action will fail.

Example workflow (Put the following text into `.github/workflows/main.yml`):
```yaml
on: push
name: Lint Python
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: cclauss/Find-Python-syntax-errors-action@master
```
## Flake8 finds Python 3 syntax errors and undefined names
$ __flake8 . --count --select=E9,F63,F72,F82 --show-source --statistics__

__E901,E999,F821,F822,F823__ are the "_showstopper_" [flake8](http://flake8.pycqa.org) issues that can halt the runtime with a SyntaxError, NameError, etc. These 5 are different from most other flake8 issues which are merely "style violations" -- useful for readability but they do not effect runtime safety.
* F821: undefined name `name`
* F822: undefined name `name` in `__all__`
* F823: local variable name referenced before assignment
* E901: SyntaxError or IndentationError
* E999: SyntaxError -- failed to compile a file into an Abstract Syntax Tree

## Instead of using this action, you can add the file `.github/workflows/lint_python.yml` to your repo...
```yaml
name: lint_python
on: [pull_request, push]
jobs:
  lint_python:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
      - run: pip install bandit black codespell flake8 isort mypy pytest pyupgrade safety
      - run: bandit --recursive --skip B101 . || true  # B101 is assert statements
      - run: black --check . || true
      - run: codespell || true  # --ignore-words-list="" --skip=""
      - run: flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
      - run: flake8 . --count --exit-zero --max-complexity=10 --max-line-length=88 --show-source --statistics
      - run: isort --check-only --profile black . || true
      - run: pip install -r requirements.txt || true
      - run: mypy --install-types --non-interactive . || true
      - run: pytest . || true
      - run: pytest --doctest-modules . || true
      - run: shopt -s globstar && pyupgrade --py36-plus **/*.py || true
      - run: safety check
```
