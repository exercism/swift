# Tests

## Running Tests

When you are in the directory for an exercise, you should see two subdirectories:

* `Sources/<Exercise>` contains your solution to the exercise
* `Tests/<Exercise>Tests` contains the tests to run for the exercise

If you're in the right directory (i.e. the one containing `Sources` and `Tests`), you can run the tests for that exercise by running `swift test` if you are using 5.4 or later:

```bash
$ pwd
/Users/johndoe/Code/exercism/swift/hello-world

$ ls
HELP.md  Package.swift  README.md  Sources  Tests

$ swift test
```

If you are using `5.1` through `5.3` you may have to add the `--enable-test-discovery` flag:

```bash
$ swift test --enable-test-discovery
```

This will run all of the test files in the `Test` directory.

For concept exercises, when you got a test passing change the `false` in the `XCTSkipIf` to `true` to enable the next test.

## Submitting Your Solution

To upload a solution to Exercism, you have to be in the directory containing the `Sources` and `Tests` directories.

```bash
$ exercism submit 
```
