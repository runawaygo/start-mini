#global module:false
module.exports = (grunt) ->
  
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    meta:
      banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " + "<%= grunt.template.today(\"yyyy-mm-dd\") %>\n" + "<%= pkg.homepage ? \"* \" + pkg.homepage + \"\n\" : \"\" %>" + "* Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= pkg.author.name %>;" + " Licensed <%= _.pluck(pkg.licenses, \"type\").join(\", \") %> */"

    lint:
      files: []

    qunit:
      files: ["test/**/*.html"]
    watch:
      files: "<config:lint.files>"
      tasks: "lint qunit"
    jade: 
      compile: 
        options: 
          data: 
            debug: false
          pretty: true
        files: 
          "index.html": "index.jade"
    coffee:
      options:
        bare: true
      glob_to_multiple:
        expand: true
        cwd: 'app/'
        src: ['*.coffee']
        dest: 'app/'
        ext: '.js'

    stylus:
      compile:
        files:
          'app.css': 'app.styl'
    jshint:
      options:
        curly: true
        eqeqeq: true
        immed: true
        latedef: true
        newcap: true
        noarg: true
        sub: true
        undef: true
        boss: true
        eqnull: true
        browser: true

      globals: {}

    useminPrepare:
      html: 'index.html'
    usemin:
      html: ['index.html']
      # css: ['**/*.css']
      options:
        dirs: ['temp', 'dest']
        dest:'superwolf'
    copy:
      main:
        files:[
          {src:['imgs/*'], dest:'dest/imgs/'}
        ]

  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-usemin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  
  # Default task.
  # grunt.registerTask "default", ["useminPrepare","concat","uglify","usemin", 'copy']
  grunt.registerTask "default", ["jade","coffee", "stylus", "useminPrepare","concat","uglify","usemin", 'copy']