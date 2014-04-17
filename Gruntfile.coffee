module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      files:
        expand: true
        cwd: 'src/'
        src: ['**/*.coffee']
        dest: 'lib/'
        ext: '.js'
    watch:
      coffee:
        files: 'src/**/*.coffee'
        tasks: 'coffee'
        options:
          interrupt: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask('run', ['coffee', 'watch:coffee'])
  grunt.registerTask('default', 'run')
