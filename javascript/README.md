# JavaScript Images

These images have a Node runtime built in. As part of the image, these are included:

 - `nodejs-dev`: this allows you to build C extensions.
 - `npm`: this allows you to include other JavaScript libraries.

Also, since the evaluators expect JUnit XML results, the
[jasmine](https://github.com/jasmine/jasmine-npm) and
[jasmine-reporters library](https://github.com/larrymyers/jasmine-reporters) are also included in
the image.

## Environment Variables

As part of the image, the `NODEJS` environment variable is defined. This allows your scripts to 
be run on any version of Node.
