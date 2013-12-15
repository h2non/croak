{
  cwd
  mkdirp
  rm
  chdir
  expect
  suppose
  read
  exec
  exists
  home-var
  home
  env
} = require './lib/helper'

describe 'CLI init', (_) ->
  dir = "#{__dirname}/fixtures/.tmp/cli/init"

  init-before = ->
    rm dir
    mkdirp dir
    chdir dir
  
  init-after = ->
    rm dir
    chdir cwd
  
  describe 'setup process', ->
    
    describe 'local config', (_) ->

      before init-before
      after init-after

      it 'should create .croakrc', (done) ->
        suppose(<[ init ]>)
          .on(/Enter the project name/).respond('local-project\n')
          .on(/The project has a node.js build package/).respond('y\n')
          .on(/Enter the package name/).respond('builder\n')
          .on(/project by default/).respond('y\n')
        .error (err) ->
          throw new Error err
        .end (code) ->
          expect code .to.be.equal 0
          expect exists "#{dir}/.croakrc" .to.be.true
          done!

      it 'should exists the created project in .croakrc', ->
        expect read "#{dir}/.croakrc" .to.match /\[local-project\]/
      
      it 'should have the expected package option value', ->
        expect read "#{dir}/.croakrc" .to.match /package = builder/

      it 'should have the default project', ->
        expect read "#{dir}/.croakrc" .to.match /\$default = local-project/

    describe 'global config', (_) ->

      before init-before
      after init-after
      
      before ->
        env[home-var] = dir

      after ->
        env[home-var] = home

      it 'should create .croakrc', (done) ->
        suppose(<[ init -g ]>)
          .on(/Enter the project name/).respond('global-project\n')
          .on(/The project has a node.js build package/).respond('y\n')
          .on(/Enter the package name/).respond('builder\n')
          .on(/Enable overwrite tasks/).respond('y\n')
          .on(/Enable extend tasks/).respond('y\n')
          .on(/Enable task registering/).respond('y\n')
          .on(/project by default/).respond('y\n')
        .error (err) ->
          throw new Error err
        .end (code) ->
          expect code .to.be.equal 0
          expect exists "#{dir}/.croakrc" .to.be.true
          done!

      it 'should exists the created project in .croakrc', ->
        expect read "#{dir}/.croakrc" .to.match /\[global-project\]/
      
      it 'should have the expected package option value', ->
        expect read "#{dir}/.croakrc" .to.match /package = builder/

      it 'should have the extend option to true', ->
        expect read "#{dir}/.croakrc" .to.match /extend = true/

      it 'should have the extend task registering to true', ->
        expect read "#{dir}/.croakrc" .to.match /register_tasks = true/

      it 'should have the default project', ->
        expect read "#{dir}/.croakrc" .to.match /\$default = global-project/

  /*
  describe 'force creation', (_) ->

    before ->
      rm dir
      mkdirp dir

    before ->
      chdir dir

    after ->
      rm dir
      chdir cwd

    it 'should create a new .croakrc global file', (done) ->
      suppose(<[ init ]>)
        .on(/project name:/).respond('global-project\n')
        .on(/Gruntfile path \(/).respond('../../gruntfile/Gruntfile.js\n')
        .on(/overwrite tasks\?/).respond('n\n')
        .on(/extend tasks\?/).respond('y\n')
      .error (err) ->
        throw new Error err
      .end (code) ->
        expect code .to.be.equal 0
        expect exists "#{dir}/.croakrc" .to.be.true
        done!

    it 'should exists the created project in .croakrc', ->
      expect read "#{dir}/.croakrc" .to.match /\[sample\]/
      expect read "#{dir}/.croakrc" .to.match /Gruntfile\.js/
  */