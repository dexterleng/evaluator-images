# Coursemology Evaluator Images

These images are used to run code packages in controlled containers. The names of the images follow
the namespacing as used in the [polyglot](https://github.com/Coursemology/polyglot)
`Coursemology::Polyglot::Language` subclasses.

The images are built on top of a `base` image, which installs `make` and configures the container
command. All other images install the required packages for that language.
