module horrific;

///Start here
struct Horrific(string importPath, string libName = "")
{
    import pre, parse, becometh;

    static if (libName != "")
    {
        pragma(lib, libName);
    }
    private
    {
        enum srcFile = import(importPath);
        enum preProcessed = preProcess(srcFile);
        enum tags = parseLines(preProcessed);
        enum mixinThis = structMixin(tags);
    }
    mixin(mixinThis);
}
