# Tests

## Running Tests

When you are in the directory for an exercise, you should see two subdirectories:

* `Sources/<Exercise>` contains your solution to the exercise
* `Tests/<Exercise>Tests` contains the tests to run for the exercise

If you're in the right directory (i.e. the one containing `Sources` and `Tests`), you can run the tests for that exercise by running `swift test`:

```bash
$ pwd
/Users/johndoe/Code/exercism/swift/hello-world

$ ls
HELP.md  Package.swift  README.md  Sources  Tests

$ swift test
```

When you got a test passing remove `.enabled(if: RUNALL)` in the `@Test` statement to enable the next test, alternatively you can run all the tests with the `RUNALL` environment variable set to `true` on Linux or macOS:

```bash
$ export RUNALL=true
```

Or if you are using PowerShell on Windows:

```powershell
set RUNALL=true
```

## Submitting Your Solution

To upload a solution to Exercism, you have to be in the directory containing the `Sources` and `Tests` directories.

```bash
$ exercism submit 
```
