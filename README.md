# horrificInclude
## Usage
```D
auto x = Horrific!"filename.h";
x.callAFunction;
x.global = 45;
```

### Includes
Includes must be of form `<*>`, because the library looks in locations given to dmd in `-J` flag not those local to the library

## Reasons to never use this ever
* Likely incorrect implementation of relatively complicated C standard
* Potentially huge compile time memory usage 
* Guaranteed slower compile times for big headers

## Error? 
If something fails in a confusing way, check the syntax of the header with `-E`.
This library practically assumes vaguely correct syntax so use a proper compiler to see what's broken.

* Includes are done before `\` lines, so multiline includes do not work.