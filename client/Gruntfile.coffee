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
    lessless:
      buildDir: '.'
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
        dirs: ['temp', 'dist']
        dest:'superwolf'
    oversprite:
      all:
        spritelist: [
          {
            'src': [ 'imgs/*.png' ],
            'dest': 'dist/sprite.png'
            'algorithm': 'alt-diagonal'
            'engine': 'gm'
            'exportOpts': 
              'format': 'png'
              'quality': 90
          }
        ]
        csslist: [
          {
            'src':  'star.css',
            'dest': 'star.sprite.css',
            'base': 'dist/'
          }

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-usemin'
  grunt.loadNpmTasks 'grunt-lessless'
  grunt.loadNpmTasks 'grunt-oversprite'
  
  # Default task.
  grunt.registerTask "default", ["lessless", "useminPrepare","concat","uglify","usemin","oversprite"]
