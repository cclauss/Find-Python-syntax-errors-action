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
