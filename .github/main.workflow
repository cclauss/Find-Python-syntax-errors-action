workflow "on push" {
  on = "push"
  resolves = ["Python Style Checker", "Python Syntax Checker", "GitHub Action for Flake8", "GitHub Action for pylint", "GitHub Action for pytest", "GitHub Action for pyup Safety", "GitHub Action for cpplint"]
}

action "Python Style Checker" {
  uses = "andymckay/pycodestyle-action@master"
}

action "Python Syntax Checker" {
  uses = "cclauss/Find-Python-syntax-errors-action@master"
}

action "GitHub Action for Flake8" {
  uses = "cclauss/GitHub-Action-for-Flake8@master"
  args = "flake8 . --max-line-length=88"
}

action "GitHub Action for pylint" {
  uses = "cclauss/GitHub-Action-for-pylint@master"
  args = "pylint --help"
}

action "GitHub Action for pytest" {
  uses = "cclauss/GitHub-Action-for-pytest@master"
  args = "pytest"
}

action "GitHub Action for pyup Safety" {
  uses = "cclauss/GitHub-Action-for-pyup-Safety-CI@master"
  args = "safety check --full-report"
}

action "GitHub Action for cpplint" {
  uses = "cclauss/GitHub-Action-for-cpplint@master"
  args = "cpplint ."
}
