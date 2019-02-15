workflow "on push" {
  on = "push"
  resolves = ["Python Style Checker", "Python Syntax Checker"]
}

action "Python Style Checker" {
  uses = "andymckay/pycodestyle-action@master"
}

action "Python Syntax Checker" {
  uses = "cclauss/Find-Python-syntax-errors-action@master"
}
