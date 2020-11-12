var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require("express-session");
var app = express();
const methodOverride =  require('method-override'); // Pasar poder usar los métodos PUT y DELETE

// view engine setup
app.set('views', [path.join(__dirname, '/views'), path.join(__dirname, '/views', 'products'), path.join(__dirname, '/views', 'users')]);
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '../public')));
app.use(methodOverride('_method')); // Pasar poder pisar el method="POST" en el formulario por PUT y DELETE
/* session */
app.use(session({
  secret : "login",
  resave : true,
  saveUninitialized : true
}));


// ************ Route System require and use() ************

var indexRouter = require('./routes/indexRoutes'); // mainsite route
var productsRouter = require('./routes/products'); // products route
var usersRouter = require('./routes/usersRoutes'); // users route

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use("/products", productsRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
