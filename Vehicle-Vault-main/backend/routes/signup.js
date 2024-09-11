var express = require('express');
var router = express.Router();
var db=require('../config');

// to display registration form 
router.get('/signup', function(req, res, next) {
  res.render('signup-form');
});

// to store user input detail on post request
router.post('/signup', function(req, res, next) {
    
    inputData ={
        fulllname: req.body.fullname,
        email: req.body.email,
        password: req.body.password,
        confirm_password: req.body.confirm_password
    }
// check unique email address
var sql='SELECT * FROM registration WHERE email_address =?';
db.query(sql, [inputData.email_address] ,function (err, data, fields) {
 if(err) throw err
 if(data.length>1){
     var msg = inputData.email_address+ "was already exist";
 }else if(inputData.confirm_password != inputData.password){
    var msg ="Password & Confirm Password is not Matched";
 }else{
     
    // save users data into database
    var sql = 'INSERT INTO registration SET ?';
   db.query(sql, inputData, function (err, data) {
      if (err) throw err;
           });
  var msg ="Your are successfully registered";
 }
 res.render('registration-form',{alertMsg:msg});
})
     
});
module.exports = router;