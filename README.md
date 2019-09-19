# Output-Capture

[![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/Output-Capture)

Captures the output of common objectscript terminal verbs, such as zwrite

Have you ever found great value in what zwrite, zzdump etc. outputs to the terminal? Did you ever want to store that information in a variable or something useful? Now you can!

## Usage

This function has **two** parameters: the variable, and the verb. The variable can be whatever you want to inspect, and the verb can be any of the following that normally output to the terminal:

- zwrite
- zzwrite
- zzdump
- write

The verb parameter is optional, and defaults to zwrite, but add any of these as a string to the second parameter of the function call to receive its output, like the following:

```
USER>set YOUR_VARIABLE = {"some":"thing"}
USER>write ##class(OutputCapture.capture).Get(YOUR_VARIABLE,"zzdump")
USER>41@%Library.DynamicArray
```

## Example

If you'd like to this is in action immediately, just call the second provided function for an example:

```
USER>write ##class(OutputCapture.capture).Example()
USER>0000: 33 37 40 25 4C 69 62 72 61 72 79 2E 44 79 6E 61         37@%Library.Dyna
0010: 6D 69 63 4F 62 6A 65 63 74                              micObject{65275,58264{4{
```

This function sends a simple variable with the zzdump command, and loops through the returned object and outputs it so that you can see what everything looks like.

## Version history
2019-09-19 - v1.0 - Initial commit of functions with features outlined in description
