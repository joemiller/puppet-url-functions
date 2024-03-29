puppet-url-functions
====================

A collection of custom functions for manipulating URLs in puppet manifests
and templates.

We developed this code to handle situations where multiple applications in
our environment would share URLs as configuration variables, but would sometimes
expect the URLs in different formats.

For example, while one app may expect `http://api/service/` another may
require `http://api/service`.

Compatibility
-------------

Only tested with Puppet 2.7.  If you have success with other versions, please
let me know.  I would expect it would at least work with 2.6, not sure
about 0.25 or earlier, however.

Functions
---------

### with_trailing_slash

Takes a string representing a URL and returns a string with a trailing slash, eg:

    with_trailing_slash( "http://web.dom.tld/path")  # => "http://web.dom.tld/path/"
    with_trailing_slash( "http://web.dom.tld/path/") # => "http://web.dom.tld/path/"

### without_trailing_slash

Takes a string representing a URL and returns a string without a trailing slash, eg:

    without_trailing_slash( "http://web.dom.tld/path")  # => "http://web.dom.tld/path"
    without_trailing_slash( "http://web.dom.tld/path/") # => "http://web.dom.tld/path"

### make_http

Takes a string representing a URL and returns a string with 'http://' prepended.  It
tries to be smart and handle various formats and many protocols, eg:

    make_http( "http://web.dom.tld" )   # => "http://web.dom.tld"
    make_http( "https://web.dom.tld" )  # => "http://web.dom.tld"
    make_http( "smtp://web.dom.tld" )   # => "http://web.dom.tld"
    make_http( "web.dom.tld" )          # => "http://web.dom.tld"

### make_https

Takes a string representing a URL and returns a string with 'https://' prepended.  It
tries to be smart and handle various formats and many protocols, eg:

    make_http( "http://web.dom.tld" )   # => "https://web.dom.tld"
    make_http( "https://web.dom.tld" )  # => "https://web.dom.tld"
    make_http( "smtp://web.dom.tld" )   # => "https://web.dom.tld"
    make_http( "web.dom.tld" )          # => "https://web.dom.tld"

    
Install
-------

1. Enable pluginsync on your puppet master
2. Copy into your puppet master's module path, eg: `/etc/puppet/modules/puppet-url-functions`


Usage
-----

### inside manifests

Using the functions inside manifests is straightforward, example:

    $url = "http://web.dom.tld/path"
    $url_with_slash = with_trailing_slash( $url )

### inside templates

Using the functions inside templates requires a little extra work. You
must declare the functions you wish to use in the template, and
you must call the function as `scope.function_<function_name>`. Example:

    <% Puppet::Parser::Functions.function('with_trailing_slash') -%>
    <% Puppet::Parser::Functions.function('without_trailing_slash') -%>
    {
        "api":"<%= scope.function_with_trailing_slash( url ) %>"
       ...

Future
------

Add the following functions:

* get_path
* get_protocol
* anything else that makes sense for manipulating url's


Support
-------

Use github issues: https://github.com/joemiller/puppet-url-functions

Contributing
------------

* Fork the repository on github
* make your changes, test, commit, push to github
* send a pull request

Testing
-------

Tests are now implemented with the rspec-puppet gem.  To run them, execute
`rake`.

You can find the older tests in the old-tests/ subdirectory.  These tests
are also decent examples of how to use the functions in both
manifests and templates so I've left them in for reference but I don't
expect to update them going forward.

License
-------
(This is an MIT-style license)

Copyright (c) 2011 Joe Miller.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

 

