# Croak [![Build Status](https://secure.travis-ci.org/AdesisNetlife/croak.png?branch=master)][9] [![Dependency Status](https://gemnasium.com/AdesisNetlife/croak.png)][10] [![NPM version](https://badge.fury.io/js/croak.png)][11] [![Roadchange](https://roadchange.com/AdesisNetlife/croak/badge.png)][12]

> Grunt made easy for large projects. It's like One Ring to rule them all, but for Grunt

**Disclaimer**:
Croak is still an initial version, but it's ready-to-use in relaxed environments

## About

<img align="right" height="280" src="http://oi44.tinypic.com/f3azc7.jpg" style="float: right" />

[Grunt][1] is an awesome task runner and build automation tool largely adopted for [node.js][7]

Croak is just a simple, but featured wrapper for Grunt that aims to help you to manage
and orchestrate Grunt tasks configuration (aka Gruntfile) in large and distributed projects,
helping you to avoid redundancy, saving time and reducing dramatically changes impact
during the project life-cycle and development workflow

### Features

- Allows you to centralize your Gruntfile in one place and use it from many places
- Easily manages and orchestrates different configuration for multiple projects
- Avoid redundant Grunt configuration over multiple repositories
- Abstracts and provides more control for Grunt tasks configuration
- Support to use and discover global node packages as Grunt configuration package
- Extends or overwrites global Gruntfile from local configuration
- Provides the same Grunt API and very similar CLI (things won’t change too much)
- Customizes Grunt execution options from a config file (future `.gruntrc`)
- You don’t need to have Grunt NPM task locally installed in order to run tasks

## Installation

It is recommended that you install Croak as global package:
```shell
$ npm install croak -g
```

Then, create the configuration file:
```
$ croak init -g
```

The above command will create a `.croakrc` file in your user home directory, as global configuration.

Still confused? Please, take some minutes to read the detailed documentation below


## Table of Contents

- [Why we created Croak?](#why-we-created-croak)
  - [When do I NOT need it?](#when-do-i-not-probably-need-it-)
  - [When do I need it?](#when-do-i-need-it)
- [How it works](#how-it-works)
  - [Example use case scenario](#example-use-case-scenario)
  - [Can abstraction be dangerous?](#can-abstraction-be-dangerous)
- [Current stage](#current-stage)
  - [Grunt support](#grunt-support)
- [Using Croak](#using-croak)
  - [Configuration file](#configuration-file)
    - [Global config](#global-config)
    - [Local config](#local-config)
    - [Available config options](#available-configuration-options)
      - [Global options](#global-options)
      - [Croak-specific](#croak-specific)
      - [Grunt-specific](#grunt-specific)
  - [Switching to Croak](#switching-to-croak)
    - [Adapting your existing Gruntfile](#adapting-your-existing-gruntfile)
    - [Use Croak from an existing Gruntfile](#use-croak-from-an-existing-gruntfile)
  - [Croakfile](#croakfile)
  - [Command-line interface](#command-line-interface)
    - [Running tasks](#running-grunt-tasks)
    - [Configuration](#configuration)
  - [Programmatic API](#programmatic-api)
- [FAQ](#faq)
- [Development](#development)
- [Contributing](#contributing)
- [To Do/Wish list](#to-dowish-list)
- [Contributors](#Contributors)
- [License](#license)

<!--
 [Caveats](#caveats)
-->

## Why we created Croak?

Croak arises from the need to create a specific solution to abstract all the automation configuration stuff. It allows you to delegate responsibilities properly in your project to the developers, without losing the desired level of control and centralization.

Because a design principle, node.js (and consequently Grunt) packages and its dependencies are locally installed, and that is fantastic. However, this is not always the best choice for some scenarios.
As you probably already know, dependencies globalization in node.js can be considered an anti-pattern, but globalization can be an ideal choice if you are in a big and distributed project.

When a project have a considerable number of repositories, by inertia you probably tend to
use the local packages and configuration across each different repository, but these configurations are usually equal
or very similar for each different repository.

The above project scenario is really hard to maintain when you need to apply
changes massively in your project, like automation, building or deployment configuration changes that is completely usual during the project evolution

Croak is created to supply this need. It aims to provide a specific solution to easily centralize and orchestrate Grunt configuration, so that you can rapidly apply massive changes in your project.

Croak has basically two main goals:

- Reduces the Grunt configuration changes impact during your project life-cycle
- Gives configuration control and provides abstraction to developers, without hurting their feelings

### When do I NOT (probably) need it?

- When you have only one or two repositories in your project
- When you have an ultra specific grunt config on each project repository
- When you or your team don’t want to spend time updating/synchronizing build configuration
- When you don’t need to centralize and (consequently) don’t need to take the control
- When you have a lot of free time and you enjoy doing redundant and not very interesting tasks
- When developers of your project... (at least one):
  - are ultra skilled and responsible guys
  - have a lot of time to maintain their own automation tasks configuration
  - need to take full control of the automation tasks configuration

### When do I need it?

- When you want to centralize and take control of the project building and automation configuration
- When you want to reduce the configuration change time and impact in your project
- When your project have a considerable number of repositories (more than 3)
- When your project configuration is equal or very similar in different repositories
- When you want to keep clean each repository of Grunt tasks
- When you do NOT want to spend time doing redundant and not very funny stuff
- When you do not want to spend much time providing support to developers about configuration stuff
- Or whatever is not on the 'When do I not need' list...

## How it works

In a few words, Croak allows you to have a multiple `Gruntfile` in global locations and runs them using a simple project identifier (like a linker). It also allows you to define pre-configured options to pass to Grunt in a simple configuration file

Moreover, Croak allows you to extend or overwrite Gruntfile configurations, so you can provide a way to customize tasks configuration from local configuration (see the [Croakfile](#croakfile) section)

### Example scenario

A representative scenario could be, for example, that your project has a relevant
number of repositories. Each repository needs its automation configuration
for development, testing or building stuff.

Usually, this configuration tends to grow when your repository has a certain amount of different tasks and it also tends to be very similar or redundant in different repositories in your project

For example you could need the same tasks in your project to run tests, generate documentation,
statically analyze the code, generate a coverage report or measure the code complexibility

Continuous changes and improvements are a permanent feature in any software project, and Croak just helps with that

You can see a complete example project structure using Croak [here][6]

### Can abstraction be dangerous?

Abstraction is not always the best choice and some people can hate it.
Basically, an abstraction in software development tries to reduce notably the complexity,
underlines details and gives more control

With Croak you can provide an ideal level of abstraction to developers without losing  control and,
additionally, give them freedom if they want to customize or extend Grunt configuration allowing them to
adapt it to their needs

If you want to make less impact to the developers, take a look to the [Croak Grunt faker][14]

## Current stage

Croak is an initial ready-to-use version, though it’s under active development process and important changes can be done in a near future version

#### Grunt support

Croak supports Grunt `~0.4.0`

## Using Croak

### Configuration file

Croak uses disk files to store persistently the configuration. The Croak configuration file must be called `.croakrc`

Croak supports two types of configuration files

#### Global config

A global file can store your project configuration and this configuration will be used in each Croak execution

It will be located in the user home directories by default.

If you want to define a global cross-user shared configuration, you can define `CROAKRC` environment variable in order
to specify a custom global file location, instead of the current user home directory

#### Local config

Local file can be located in any path, but it’s recommended that you create it in your project or repository root folder

Usually, a local file should have only one project configured.
Any local configuration has priority and will overwrite global configuration (for example, if you configure the same project in both files)

Croak implements a similar file discovery algorithm like the one Grunt uses to discover the Gruntfile

### Available configuration options

#### Global config

| Name           | Type      | Default     | Description                                    |
| -------------- | --------- | ----------- | ---------------------------------------------- |
| $default       | `string`  | undefined   | Project to use by default when no project is defined. Useful to use in local configuration and avoiding to pass the `--project` flag via CLI |

#### Per-project config

##### Croak-specific

| Name              | Type      | Default     | Description                                    |
| ----------------- | --------- | ----------- | ---------------------------------------------- |
| package           | `string`  | undefined   | Node package which contains the Gruntfile. It will be resolved as local and global package. This is a recommended alternative to the `gruntfile` option |
| extend         | `boolean` | false       | Enable extend existing tasks from Croakfile |
| overwrite      | `boolean` | false       | Enable overwrite existing tasks from Croakfile |
| register_tasks | `boolean` | false       | Enable register/create new tasks from Croakfile |
<!--
| cwd            | `string`  | ${PWD}      | Working directory to pass to Grunfile. Default to ${PWD} or local `.croakrc` path. Don't use this option unless you know what you are doing |
-->

##### Grunt-specific

The following options will be (probably) available in Grunt in future versions, inside a file called `.gruntrc`, however, Croak already supports it

| Name           | Type      | Default     | Description                                    |
| -------------- | --------- | ----------- | ---------------------------------------------- |
| gruntfile      | `string`  | undefined   | Path to your Gruntfile. It can be a relative path. You should define this option in all of your projects. If you define the `package` option, Gruntfile path will be relative to the `package` root directory. By default, Croak tries to find it in the package root folder or inside the `grunt` directory. You only need to use this option with `package` if your Gruntfile exist in a custom directory |
| base           | `string`  | undefined   | Specify an alternate base path. By default, all file paths are relative to the Gruntfile |
| no_color       | `boolean` | false       | Disable colored output |
| debug          | `boolean` | false       | Enable debugging mode for tasks that support it |
| stack          | `boolean` | false       | Print a stack trace when exiting with a warning or fatal error |
| force          | `boolean` | false       | A way to force your way past warnings. Don’t use this option, fix your code |
| tasks          | `string`  | undefined   | Additional directory paths to scan for task and "extra" files |
| npm            | `string`  | undefined   | Npm-installed grunt plugins to scan for task and "extra" files |
| no_write       | `boolean` | false       | Disable writing files (dry run) |
| verbose        | `boolean` | false       | Verbose mode. A lot more information output |


You can use any of the config options also as a command line flag. See the Grunt CLI [documentation][1]

##### Example file configuration

A multi-project `.croakrc` configuration file

```ini
$default = my-project

[super-project]
extend = true
gruntfile = ${HOME}/projects/super-project/build/Gruntfile.coffee
debug = true
stack = true

[my-project]
extend = true
overwrite = true
register_tasks = true
; resolve an node package in the system locally and globally installed
; then Croak will try to discover the Gruntfile inside the package directory
package = my-project-builder
; grunt-specific
base = ${HOME}/projects/my-project/my-package/
no_color = false
no_write = false
debug = false
verbose = false
force = true
stack = true
tasks = ../custom-tasks/
npm = mytask
```

You can use any existing environment variables in config values, using the `${VARIABLE_NAME}` notation

##### Notes about cross-OS variables

In order to use the same config values across diferent OS, Croak will transparently translate
common environment variables to the specific running OS

For example, if your use `${HOME}`, Croak will translate it into `%USERPROFILE%` under Windows and viceversa.
The same case is applied for `${PWD}`, `${TMPDIR}`, `%HOMEDRIVE%`, translating this last one into `/` under Unix-like OS

##### Built-in Croak variables

Additionally, Croak introduces support for an easy way to use relative paths from Croak-specific files locations,
like the `.croakrc` config file path

| Variable       | Value |
| -------------- | ------------------------------------------------- |
| CROAKRC_PATH   | Absolute path to the `.croakrc` local file. If it doesn’t exist, $PWD will be used instead |
<!--
| GRUNTFILE_PATH | Absolute path to the used `Gruntfile`. If it doesn’t exist, ${PWD} will be used instead |
| CROAKFILE_PATH | Absolute path to the used `Croakfile`. If it doesn’t exist, ${PWD} will be used instead |
-->

## Switching to Croak

### Adapting your existing Gruntfile

Croak will automatically expose the croak object in Gruntfile, so you can use this
configuration like template values in your tasks config

This is really useful because, in much cases, you need to use absolute paths in your Gruntfiles

**Croak grunt object**

The following properties will be available as Croak task in Grunt.
You can use it as Grunt templating in tasks configuration. If you don't use the `base` option, you should use one of the
following options to configure your tasks in order to use absolute paths

| Option         |  Description |
| -------------- | ------------------------------------------------- |
| **cwd**        | Absolute path to the current user working directory from where Croak was called  |
| **root**       | Absolute path to the existing `Croakfile` or `.croakrc` directory. If both files don’t exists, cwd will be used instead |
| **config**     | Absolute path to the local .croakrc file directory. If it doesn’t exist, it will be null |
| **base**       | Configured base path. If the base options doesn’t exist, cwd will be used |
| **gruntfile**  | Absolute path to the current used Gruntfile |
| **croakfile**  | Absolute path to the current used Croakfile, if it exists |
| **version**    | Current Croak version |
| **npm**        | Grunt npm load packages |
| **tasks**      | Grunt tasks load path |
| **options**    | Croak current config options object |

The above properties will be also available from `grunt.croak` object

**Example Gruntfile**

```js
module.exports = function (grunt) {
  if (grunt.croak) {
    grunt.log.writeln('Running Grunt from Croak (v.' + grunt.croak.version + ')');
  }

  grunt.initConfig({
    clean: {
      options: {
        force: true
      },
      views: '<%= croak.cwd %>/tmpl/'
      tmp: '<%= croak.root %>/.tmp/'
    },
    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      all: [
        '<%= croak.base %>/src/scripts/{,*/}*.js'
        '<%= croak.config %>/demo/{,*/}*.js'
        '!<%= croak.root %>/src/scripts/vendor/*.js'
      ]
    },
    connect: {
      server: {
        options: {
          port: 9001,
          base: '<%= croak.root %>'
        }
      }
    }
  });
};
```

#### Use Croak from an existing Gruntfile

**The Croak Grunt task is still in progress**

<!--
If you already have `Gruntfile.js` in each local repository of your project and you don’t want to switch
radically to Croak, you can use the `grunt-croak` task to have a smaller configuration impact
with the same result

##### Install the task

```
$ npm install grunt-croak --save-dev
```

##### Add it in your Gruntfile

```
grunt.loadNpmTasks('grunt-croak')

grunt.initConfig({
  croak: {
    my_project: {
      options: {
        gruntfile: 'path/to/Gruntfile.js',
        verbose: true
      }
    }
  }
})
```

For more information, see the [grunt-croak][2] documentation
-->

### Croakfile

Like Grunt, Croak has its own specific tasks configuration file.

The Croakfile has the same API as Grunt and it can also be a JavaScript or CoffeeScript file. The module should export a `function`, like in Grunt

The idea behind the Croakfile is to provide an isolated configuration file without conflicting with Gruntfile
for specifically extend or overwrite Grunt tasks configuration from local config to global config

If the Croak project configuration allows `extend` or `overwrite` Grunt config, you can use the Croakfile to
customize and overwrite globally configured tasks to adapt it to your needs

```js
module.exports = function (croak) {

  croak.log.ok('Version:', croak.version)
  croak.log.ok('Grunt version:', croak.grunt.version)

  croak.extendConfig({
    log: {
      foo: {},
      bar: 'hello croak'
    },
    read: {
      files: [
        '<%= croak.root %>/file.json'
        __dirname + '/another-file.json'
      ]
    }
  })

  // you can also register new tasks if 'register_tasks' option is enabled
  croak.registerMultiTask('log', 'Log stuff.', function() {
    grunt.log.writeln(this.target + ': ' + this.data)
  })

  croak.registerMultiTask('read', 'Read file.', function() {
    grunt.log.writeln(this.target + ': ' + this.data)
  })

  croak.registerTask('default', ['log'])

}
```

#### Croakfile API

The Croakfile API inherits from Grunt API.
You can do the same thing in a Gruntfile. Please, see the [Gruntfile documentation][13] for more information

Additionally, Croak provides the next useful and Grunt missing API

##### croak.extendConfig(config)
Alias to grunt.initConfig(), but just for a more semantic usage from Croakfiles

##### croak.task.exists()
Check if a tasks were already registered and exist

##### croak.grunt
Exposes the native Grunt API module object.
If you use directly the Grunt API, for example, to register new tasks or remove config, Croak will not control if you can do it.
Use it under your own reponsibility

### Command-line interface

Croak provides a straightforward CLI that allows you to do almost everything (including all that you can do with Grunt CLI).

Aditionally, if you are convervatory and you want to use Croak keeping the same native Grunt CLI interface,
take a look to the [Croak Grunt faker][14]

```
  Usage: croak [options] [command]

  Commands:

    help
      Output the usage information
    version
      Output the version information
    init [options] [name]
      Create new projects in .croakrc
    config [options] <action> [key] [value]
      Read/write/update/remove croak config
    run [options] [task]
      Run Grunt tasks
    add [options] [name]
      Add new projects in .croakrc

  Options:

    -h, --help     output usage information
    -V, --version  output the version number

  Usage examples:

    $ croak init [name]
    $ croak add [name]
    $ croak config [create|list|get|set|remove]
    $ croak run task
    $ croak grunt task

  Command specific help:

    $ croak <command> --help

  Grunt help:

    $ croak grunt --help

```

#### Running Grunt tasks

```
$ croak run task -p my-project
```
You need to pass the `-p` flag if there’s not a `.croakrc` local config file

You can configure the default project to use from a local config file, like this:
```ini
$default = my-project
```
Then you can simply run:
```
$ croak run task
```

You can also run subtasks:
```
$ croak run task:subtask
```

or multiple tasks:
```
$ croak run task anothertask
```

#### Configuration

Show the current existing config
```
$ croak config list
```

Create a config file (add `-g` flag to create it globally)
```
$ croak config create
```

You can CRUD config values easily from CLI
```
$ croak config [get|set|remove] <key> [value] [-g]
```

### Programmatic API

You can use Croak as node.js module to integrate it in your application

> **Disclaimer**:
> Croak API can change radically in a near future.
> Retrocompatibility is not guaranteed for minor `0.x.x` beta releases

#### Installation

Install Croak as local package
```
$ npm install croak [--save] [--save-dev]
```

Then require the module
```js
var croak = require('croak')
```

#### Croak API
The `croak` module exposes the following members

##### version
Current Croak module version

##### gruntVersion
The current Grunt version (which is using Croak)

##### grunt
Expose the Grunt module object. See [Grunt API][8] for more information

##### config
Exposes the Croak [config](#croak-config-api) module API

##### load([ configPath ])
Discover configuration files, then it will read, parse and load projects configuration

##### loadProject([ configPath ])
Load config and returns the default configured project, it it exists

##### get([ key ])
Alias to [config#get](#configget-key-)

##### set(key [, value, isLocalConfig])
Alias to [config#set](#configsetkey--value-islocalconfig)

##### init([ options, projectObj ])
This method will configure Croak with the passed options config object
and aditionally you can pass the project config object
(that you should get it previously via [croak.config.get()](#config-get--key-))

After it, Croak will try to discover Croakfiles, and then configure and run Grunt

##### initGrunt([ options ])
Configure Grunt with the passed options and run it

#### Croak Config API

The Croak config object is exposed via the `croak` module

```js
var config = require('croak').config
```

##### config.load([ filePath ])
This method tries to discover configuration files, then it will read, parse and load them
It will **throw an Error exception** if cannot read or parse configuration files

##### config.save([ filePath ])
Saves existing loaded configuration in disk

It will **throw an Error exception** if cannot write data

##### config.raw()
Returns an `object` with both global and local properties with
the config data as raw string (ini format)

##### config.get([ key ])
Retrieves an existing config value querying by its key. If not argument is passed, it will return the whole config

```js
croakConfig.get('my-project') // { gruntfile: './path/to/Gruntfile.js' ... }
croakConfig.get('my-project.gruntfile') // './path/to/Gruntfile.js'
```

##### config.getDefault()
Returns the default configured project config object. If it is not configured,
it will return the first existing project, first by looking into local config, and then in the global one


##### config.set(key [, value, isLocalConfig])
Setter method for config values. You can set a new project, or a specific project config value with a primitive type

```js
croakConfig.set('my-project', { gruntfile: '../Gruntile.js' })
croakConfig.set('my-project.gruntfile', '../new/path/to/Gruntile.js')
```

##### config.setLocal(key [, value])

##### config.remove(key)
Removes a config value

```js
croakConfig.remove('my-project') // removes the whole project
croakConfig.remove('my-project.gruntfile') // removes a specific key
```

##### config.value(key [, value, isLocalConfig])
Alias accessor method for `set()` and `get()`

```js
croakConfig.value('my-project') // I'm getting a value
croakConfig.value('my-project.gruntfile', '../Gruntfile.js') // I'm setting a value
```

##### config.globalFile()
Returns the absolute path to the global configuration file in the system

##### config.localFile([ filePath ])
Returns the absolute path to the local configuration file

Croak implements a simple algorithm like Grunt or NPM in order to discover the configuration
file in the current and in higher directories.

Optionally, you can explicitly define a configuration path file to use passing the `filePath` argument

##### config.clean()
Clean loaded config from cache. To apply it persistently in the disk, you must call it [config#save()](#save-filepath-)

##### config.hasData()
Returns `true` if the configuration was loaded and exists

##### config.exists([ key ])
Check if a given property key exists in the current config

```js
config.exists('project') // true
config.exists('nonexisting.gruntfile') // false
```

##### config.path()
Returns an `object` with absolute paths to both global and local config files

```js
config.path()
// { local: '/home/user/.croakrc', local: '/home/user/projects/awesome/.croakrc' }
```

##### config.dirname()
The same as config#path(), but this one only will return the absolute path directory
where the config file is located


## FAQ

**Do I need to have Grunt already installed?**

No, Croak will do it for you. And also
`grunt-cli` will be replaced by Croak CLI

**Can I use the Grunt CLI?**

Of course, it’s available using the `grunt` command

```
$ croak grunt --help
```

**Do I need to have a Gruntfile in my repository?**

No. An already existing Gruntfile is not required.

You only need to specify the global Gruntfile you want to use
and, optionally, you can use a Croakfile to overwrite or extend global configuration

**Can I use both Croak and Grunt at the same time?**

Yes. You must specify a global Gruntfile and also have your own repository Gruntfile.

You can run both like this:

```
$ croak run task -p project
```
```
$ croak grunt localtask
```

## Development

Only node.js is required for development

1. Clone/fork this repository
```
$ git clone git@github.com:adesisnetlife/croak.git && cd croak
```

2. Install package dependencies
```
$ npm install
```

3. Run tests
```
$ npm test
```

4. Coding zen mode
```
$ grunt dev [--force]
```

## Contributing

Croak is completely written in LiveScript language.
Take a look to the language [documentation][3] if you are new with it.
Please, follow the LiveScript language conventions defined in the [coding style guide][4]

You must add new test cases for any feature or refactor you do,
also keep in mind to follow the same design/code patterns that already exist

## To Do/Wish list

- Create an example use case project
- Switch from promptly to inquirer (more featured and pretty CLI, like yeoman)
- More test cases scenarios and destructive/evil testing
- Croak API improvements: add callbacks and event listeners for a better Grunt execution control
- Error CLI test cases
- Better messages for the CLI and verbose mode
- Better usage of the native grunt API (use grunt.option())
- Simplified and better documentation (create a wiki?)
- Support for multiple Gruntfile in the same project, or distributed Grunt tasks?
- Support for Gruntfile instead of Croakfile? Rationale: easier to understand

Do you miss something? Please, feel free to open an issue or make a PR!

## Contributors

- [Tomás Aparicio](https://github.com/h2non)

## License

Copyright (c) 2013 Adesis Netlife S.L and contributors

Released under the [MIT][5] license




![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/AdesisNetlife/croak/trend.png)

[1]: http://gruntjs.com
[2]: https://github.com/h2non/grunt-croak
[3]: http://livescript.net
[4]: https://github.com/gkz/LiveScript-style-guide
[5]: https://github.com/adesisnetlive/croak/blob/master/LICENSE
[6]: https://gist.github.com/h2non/7787640
[7]: http://nodejs.org
[8]: http://gruntjs.com/api/grunt
[9]: http://travis-ci.org/AdesisNetlife/croak
[10]: https://gemnasium.com/AdesisNetlife/croak.png
[11]: http://badge.fury.io/js/croak
[12]: http://roadchange.com/AdesisNetlife/croak
[13]: http://gruntjs.com/sample-gruntfile
[14]: https://github.com/h2non/croak-grunt-faker

