Class OutputCapture.capture
{

/// Accepts a variable and a terminal output verb (zwrite, zzwrite, zzdump, write) and returns a dynamic array
/// that contains the output of these commands.
ClassMethod Get(var, verb As %String = "zwrite") As %Library.DynamicArray
{
	// Redirects the commands output device to Device 2, which goes to the ^SPOOL global
	open 2:0 
	use 2
	// verb checks. Using indirection isn't reliable, so they're explicitly called
	if verb = "zzwrite" {zzwrite var}
	elseif verb = "zzdump" {zzdump var}
	elseif verb = "write" {write var}
	else {zwrite var}
	close 2
	
	// At this point the output has been placed in the global, and now we iterate over it to get a nice array
	set output = []
	set key = $Order(^SPOOL(0,""))
	while (key '= "") {
		do output.%Push(^SPOOL(0,key))
		set key = $Order(^SPOOL(0,key))
	}
	// Errors pile up sometimes, so clear it out on each use
	kill ^SPOOL(0)
	
	return output
}

/// Example method to demonstrate the function's use
ClassMethod Example() As %String
{
	// Junk variable to inspect
	set var = {"asdsd":"asdasdsad"}
	
	// In this example, we pass our test value and want to store its zzdump output to a variable
	set returnedArray = ..Get(var,"zzdump")
	
	// Iterates over the returned array and simply outputs it all to a string
	set out = ""
	set iter = returnedArray.%GetIterator()
	while iter.%GetNext(.key, .value) {
		set out=out_value
	}
	return out
}

}
