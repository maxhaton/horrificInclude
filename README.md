# HorrificInclude
## Usage
```D
//Make sure filename.h is present in a directory .J known to the compiler
auto x = Horrific!"filename.h";
x.callAFunction;
x.global = 45;
```

### Includes
Includes must be of form `<*>`, because the library looks in locations given to dmd in `-J` flag not those local to the library

## Reasons to never use this ever
* The implementation of the preprocessor is basically done by ear so it has to ignore `#pragma once`, currently. 
  To get around this, the Macro **__Horrific_D** is predefined. 
* Currently doesn't even try to do function macros
* Potentially huge compile time memory usage
    ```C
    #include <aFile.h>
    #include <massiveSystemHeader.h>
    ```
    When processed these effectively become nested template instantiations, which is no way to do program execution.
* Guaranteed slower compile times for big headers, when compared to doing it properly e.g. write actual D bindings

The first two issues can be worked around(e.g. Depth First file caching, then process properly), but that's not the purpose of this library.
## Error? 
If something fails in a confusing way, check the syntax of the header with `-E`.
This library practically assumes vaguely correct syntax so use a proper compiler to see what's broken.

* Includes are done before `\` lines, so multiline includes do not work.
