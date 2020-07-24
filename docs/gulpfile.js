// Minimal Gulp Setup

// npm install:
// gulp
// gulp-sass
// gulp-cssnano
// gulp-concat
// gulp-uglify

// Initialize modules
var gulp = require('gulp');
var sass = require('gulp-sass');
var cssnano = require('gulp-cssnano');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');

// Sass task: compiles the style.scss file into style.css
gulp.task('sass', function(){
    return gulp.src('dev/sass/main.scss')
        .pipe(sass()) // compile SCSS to CSS
        .pipe(cssnano()) // minify CSS
        .pipe(gulp.dest('assets/css')); // put final CSS in dist folder
});

// JS task: concatenates and uglifies JS files to script.js
gulp.task('js', function(){
    return gulp.src('dev/js/*.js')
        .pipe(uglify())
        .pipe(gulp.dest('assets/js'));
});

// Watch task: watch SCSS and JS files for changes
gulp.task('watch', function(){
    gulp.watch('dev/sass/*.scss', gulp.series('sass'));
    gulp.watch('dev/js/*.js', gulp.series('js'));    
});

// Default task
gulp.task('default', gulp.series('sass', 'js', 'watch'));
