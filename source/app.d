import std;
import horrific;
import pre;
import recursivenightmare;
void main()
{
	
	auto namedInclude = Horrific!"test.h"();
	namedInclude.preProcessed.each!writeln;
	//
	
}
