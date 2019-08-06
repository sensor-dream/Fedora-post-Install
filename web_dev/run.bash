#!/bin/env bash


#cat << EOF

npm init

list=(\
'npm-gui' \
'bower' \
'jshint' \
'shipit-deploy' \
'shipit-cli' \
'grunt' \
'grunt-cli' \
'grunt-contrib-clean' \
'grunt-contrib-coffee' \
'grunt-contrib-compass' \
'grunt-contrib-compress' \
'grunt-contrib-concat' \
'grunt-contrib-connect' \
'grunt-contrib-copy' \
'grunt-contrib-csslint' \
'grunt-contrib-cssmin' \
'grunt-contrib-handlebars' \
'grunt-contrib-htmlmin' \
'grunt-contrib-imagemin' \
'grunt-contrib-jade' \
'grunt-contrib-jasmine' \
'grunt-contrib-jshint' \
'grunt-contrib-jst' \
'grunt-contrib-less' \
'grunt-contrib-nodeunit' \
'grunt-contrib-qunit' \
'grunt-contrib-requirejs' \
'grunt-contrib-sass' \
'grunt-contrib-stylus' \
'grunt-contrib-symlink' \
'grunt-contrib-uglify' \
'grunt-contrib-watch' \
'grunt-contrib-yuidoc' \
'grunt-autoprefixer' \
'grunt-browser-sync' \
'grunt-html-build' \
'grunt-include-replace' \
'unt-email-design' \
'grunt-email-boilerplate' \
'grunt-uncss' \
'grunt-ucss' \
'grunt-revizor' \
'grunt-penthouse' \
'grunt-criticalcss' \
'grunt-csscomb' \
'grunt-styleguide' \
'grunt-html' \
'grunt-autopolyfiller' \
'grunt-babel' \
'grunt-jsfmt' \
'grunt-jsbeautifier' \
'grunt-jscs' \
'grunt-modernizr' \
'grunt-express' \
'grunt-browserify' \
'grunt-shipit' \
'grunt-plato' \
'grunt-complexity' \
'grunt-jscpd' \
'grunt-jsonlint' \
'grunt-yamllint' \
'grunt-mocha' \
'grunt-karma' \
'grunticon' \
'grunt-webfont' \
'grunt-responsive-images' \
'grunt-responsive-images-extender' \
'grunt-sharp' \
'grunt-svgstore' \
'imacss' \
'grunt-imageoptim' \
'grunt-tinypng' \
'assemble' \
'jit-grunt' \
'grunt-concurrent' \
'grunt-gulp' \
'grunt-notify' \
'grunt-git' \
'grunt-githooks' \
'grunt-gitbook' \
'grunt-jsdoc' \
'grunt-rev' \
'grunt-release' \
'grunt-version' \
'grunt-conventional-changelog' \
'grunt-bump' \
'grunt-dev-update' \
'grunt-wiredep' \
'grunt-remove-logging' \
'grunt-proxy' \
'grunt-connect-proxy' \
'grunt-phantomas' \
'grunt-preprocess' \
'time-grunt' \
'load-grunt-config' \
'grunt-newer' \
'grunt-open' \
'grunt-exec' \
'grunt-shell' \
'grunt-ssh' \
'grunt-usebanner' \
'grunt-file-info' \
'grunt-sass' \
'grunt-react' \
'runt-nunjucks' \
'grunt-dustjs' \
'grunt-html2js'\
'bootstrap' \
'bootstrap-vue' \
'bootstrap-reboot-import' \
'bootstrap-colorpicker' \
'bootstrap-sass' \
'bootstrap-loader' \
'@aorinevo/bootstrap-vue' \
'@ng-bootstrap/ng-bootstrap' \
'ngx-bootstrap' \
'boqueron-bootstrap' \
'angular-bootstrap-datetimepicker' \
'angular-bootstrap-colorpicker' \
'ember-bootstrap' \
'bootswatch' \
'react-bootstrap' \
'reactstrap' \
'react-bootstrap-typeahead' \
'react-bootstrap-table-next' \
'react-fontawesome'\
)

for i in ${!list[*]}; do
    sudo npm remove "${list[$i]}" -g;
#    sudo npm install "${list[$i]}" -g;
#    npm install "${list[$i]}" --save-dev;
done

sudo npm audit

#bower init

#bower install jquery --save
#bower install bootstrap --save
#bower install html5shiv --save
#bower install respond --save

#gem install bundler
#bundle install

#EOF

#cat << EOF > Gruntfile.js
cat << EOF > /dev/null
'use strict';

module.exports = function(grunt) {

  var globalConfig = {
    images : 'app/images',
    styles : 'app/css',
    fonts : 'app/fonts',
    scripts : 'app/js',
    src : 'src',
    bower_path : 'bower_components'
  };

  grunt.initConfig({
    globalConfig : globalConfig,
    pkg : grunt.file.readJSON('package.json'),

    copy : {
      main : {
        files : [{
          expand : true,
          flatten : true,
          src : '<%= globalConfig.bower_path %>/jquery/dist/jquery.min.js',
          dest : '<%= globalConfig.scripts %>/',
          filter : 'isFile'
        }, {
          expand : true,
          flatten : true,
          src : '<%= globalConfig.bower_path %>/html5shiv/dist/html5shiv.min.js',
          dest : '<%= globalConfig.scripts %>/',
          filter : 'isFile'
        }, {
          expand : true,
          flatten : true,
          src : '<%= globalConfig.bower_path %>/bootstrap/fonts/*',
          dest : '<%= globalConfig.fonts %>/',
          filter : 'isFile'
        }, {
          expand : true,
          flatten : true,
          src : '<%= globalConfig.bower_path %>/respond/dest/respond.min.js',
          dest : '<%= globalConfig.scripts %>/',
          filter : 'isFile'
        }]
      }
    },
    concat: {
      bootstrap: {
        src: [
          '<%= globalConfig.bower_path %>/bootstrap/js/transition.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/alert.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/button.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/carousel.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/collapse.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/dropdown.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/modal.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/tooltip.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/popover.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/scrollspy.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/tab.js',
          '<%= globalConfig.bower_path %>/bootstrap/js/affix.js'
        ],
        dest: '<%= globalConfig.src %>/<%= pkg.name %>.js'
      }
    },
    clean : {
      js : [
        '<%= globalConfig.src %>/<%= pkg.name %>.js',
        '<%= globalConfig.scripts %>/<%= pkg.name %>.min.js',
        '<%= globalConfig.scripts %>/app.min.js'
      ],
      css : [
        '<%= globalConfig.styles %>/<%= pkg.name %>.min.css',
        '<%= globalConfig.styles %>/<%= pkg.name %>-theme.min.css'
      ]
    },
    less: {
      compileCore: {
        options : {
          paths : ["styles"],
          compress : true,
          yuicompress : true,
          optimization : 2,
          cleancss : true
        },
        src: '<%= globalConfig.bower_path %>/bootstrap/less/bootstrap.less',
        dest: '<%= globalConfig.styles %>/<%= pkg.name %>.min.css'
      },
      compileTheme: {
        options : {
          paths : ["styles"],
          compress : true,
          yuicompress : true,
          optimization : 2,
          cleancss : true
        },
        src: '<%= globalConfig.src %>/style.less',
        dest: '<%= globalConfig.styles %>/<%= pkg.name %>-theme.min.css'
      }
    },
    uglify: {
      options: {
        preserveComments: 'some'
      },
      core: {
        src: '<%= concat.bootstrap.dest %>',
        dest: '<%= globalConfig.scripts %>/<%= pkg.name %>.min.js'
      },
      customize: {
        src: '<%= globalConfig.src %>/app.js',
        dest: '<%= globalConfig.scripts %>/app.min.js'
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  // Default task(s).
  grunt.registerTask('default', ['clean','less','concat','copy','uglify']);
};
EOF
