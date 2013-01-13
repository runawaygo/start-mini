#global module:false
module.exports = (grunt) ->
  
  # Project configuration.
  grunt.initConfig
    pkg: "<json:package.json>"
    meta:
      banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " + "<%= grunt.template.today(\"yyyy-mm-dd\") %>\n" + "<%= pkg.homepage ? \"* \" + pkg.homepage + \"\n\" : \"\" %>" + "* Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= pkg.author.name %>;" + " Licensed <%= _.pluck(pkg.licenses, \"type\").join(\", \") %> */"

    lint:
      files: []

    qunit:
      files: ["test/**/*.html"]

    concat:
      dist:
        src: ["lib/jquery.js",
              "lib/underscore.js",
              "lib/backbone.js",
              "lib/less-1.3.1.js",
              "lib/bootstrap/js/bootstrap.js",
              "app/init.js",
              "app/view/LeftPanel.js",
              "app/view/RightPanel.js",
              "app/app.js"]
              
        dest: "dist/<%= pkg.name %>.js"

    min:
      dist:
        src: ["<banner:meta.banner>", "<config:concat.dist.dest>"]
        dest: "dist/<%= pkg.name %>.min.js"

    watch:
      files: "<config:lint.files>"
      tasks: "lint qunit"

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

    uglify: {}

  
  # Default task.
  grunt.registerTask "default", "lint qunit concat min"
