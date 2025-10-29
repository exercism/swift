# Readme

This is a tool that allows you to generate tests file for an exercise.
The reason for this is that it can be quite tedious to create the test file for an exercise, and this tool should help with that.

## Get started

### Prerequesites

Before starting you need to have the following in place:

- You have a folder called `Test` in the exercise folder.
- You have added the exercise to the track's [`config.json`][track-config-json] file.
- The exercise folder has a `config.json` file.
- You have added the template for the exercise, which is a file called `template.swift` and found in the `.meta` folder.

### Running the generator

```bash
USAGE: Generator <exercise-slug> [--exercise-kind <exercise-kind>] [--exercise-path <exercise-path>] [--track-directory-path <track-directory-path>]

ARGUMENTS:
  <exercise-slug>         The slug of the exercise to process.

OPTIONS:
  -e, --exercise-kind <exercise-kind>
                          The kind of exercise to process. Possible
                          values: practice, concept (values:
                          practice, concept; default: practice)
  --exercise-path <exercise-path>
                          The absolute or relative path to the
                          exercise within the track directory.
                          Will use exercise kind and track path to
                          calculate if not specified.
  --track-directory-path <track-directory-path>
                          The absolute or relative path to the
                          track directory. Defaults to the current
                          directory.
  -h, --help              Show help information.
```

You can run the generator using `swift run`, which will compile and run the generator:

```bash
# Format:
$ swift run --package-path ./generator Generator <slug>

# Example:
$ swift run --package-path ./generator Generator two-fer

# Example with exercise kind
$ swift run --package-path ./generator Generator two-fer -e concept
```

or directly use the binary after compiling it:

```bash
# Compile and place binary into ./bin folder:
$ swift build -c release --package-path ./generator && cp "$(find ./generator/.build -type f -path '*/release/Generator' 2>/dev/null)" ./bin/

# Show usage and available arguments:
$ ./bin/Generator -h

# Example:
$ ./bin/Generator two-fer
```

> [!NOTE]
> Compiling in debug mode is faster, but the generated binary will run slower and be larger since it includes debug information and skips optimization steps.

The generator will automatically format the files for you, so you don't have to worry about that.

## Building templates

The templates are built using [Stencil][stencil], which is a templating language for Swift.
This allows us to have a very flexible template system, which can be used to generate the test file.
This means that you can use all the features of Stencil.

The template is fed with the json file from exercisms problem spec repository, which means building a template.
You have to look at the json file for the exercise, and then build the template based on that.

It is also recommended to look at the other templates, to get a feel for how they are built.

## Toml

The toml file found in the `.meta` folder, is used to configure which tests should be generated.
To deactivate a test write `include = false` under the uuids of the test.

```toml
[1e22cceb-c5e4-4562-9afe-aef07ad1eaf4]
description = "basic"
include = false
```

## Plugins

The generator also supports plugins, which can be used to add extra functionality to Stencils templates.
The plugins are needed since Stencil doesn't support all the features we need.

The current custom plugins are:
- `isNull`: Checks if a value is null.
- `camelCase`: Converts a string to camel case.
- `contains`: Check if value is present in a String, array or dictionary.
- `any`: Checks each element of an integer array for a specific condition: isEven, isOdd, isNegative, isPositive. The condition is passed as an argument.
- `toStringArray`: Converts input value to array of strings.
- `toStringDictionary`: Converts input value to dictionary structure.
- `inspect`: Removes escape characters from string.
- `minus`: Calculates difference between value and argument.
- `toTupleArray`: Converts input value to [[Int]] or [[String]].
- `extractCountKey`: Extracts value under "count" key value from dictionary.
- `toNilArray`: Converts input value to an array with optional values.
- `length`: Provides the length of a collection.
- `toEnumArray`: Converts input value to a enum array.
- `strain`: Performs problem-specific replacements in string.
- `round`: Rounds the value with a specified precision.
- `knapsackItem`: Snapsack specific plugin to generate Items.
- `complexNumber`: Converts input value to swift syntax.
- `listOps`: Replaces occurances of "foldr" to "foldRight"
- `defaultArray`: Provides default value if the input value is null. 

The plugins can be found in the [`Stencil.swift`][stencil-plugins] file, and can be used like this:

```swift
{{ "hello world" | camelCase }}
```

Plugins need to be discussed with the maintainers before they are created.

## How the generator works (for maintainers)

### Info

This section is for maintainers who want to know how the generator works and the knowledge needed to be able to do modifications to it.
If you are not a maintainer or exercism staff so can you skip this section.
Doing modifications to the generator as a contributor is not recommended since it can break the generator for all the exercises.
Therefore so is it recommended to contact the maintainers of the track if you want to do modifications to the generator.
Failure to do so can lead to your PR being closed without explanation.

### How the generator works

The generator is built using Swift and the [Stencil][stencil] templating language.

The generator starts by reading the `config.json` file, which contains information about the exercises.
And checks that the exercise exists in the config file, if it doesn't so will the generator exit with an error.

After that will the generator read the `.meta/tests.toml` file, which contains the information about which tests should be generated.
It parses the toml file with the [SwiftTOML][toml] library, and then loops through all uuids and adds them to an array unless the `include` key is set to false.

Then the generator will read the `problem-specifications` repository, and find the json file for the exercise.
It will parse the json file with json serialization.

It will compare the uuids from the toml file with the uuids from the json file, if there are any uuids that are not in the toml file, so will that test be removed.

After that will the generator read the template file, and then load the template engine with the plugins.
The generator will feed the template with the json file, and then render the template and then format the file.

[track-config-json]: https://github.com/exercism/swift/blob/main/config.json
[stencil]: https://github.com/stencilproject/Stencil
[stencil-plugins]: https://github.com/exercism/swift/tree/main/generator/Sources/Generator/Stencil.swift
[toml]: https://github.com/LebJe/TOMLKit
