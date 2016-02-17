# Python Images

These images have various versions of Python built in. As part of the image, these are included:

 - `python-dev`: this allows you to build C extensions.
 - `pip`: this allows you to include other Python libraries.

Also, since the evaluators expect JUnit XML results, the
[unittest-xml-reporting library](https://github.com/xmlrunner/unittest-xml-reporting) is also
included in the image.

## Environment Variables

As part of the image, the `PYTHON` environment variable is defined. This allows your scripts to 
be run on any version of Python.
